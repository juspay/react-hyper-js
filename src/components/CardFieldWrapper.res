open OrcaJs

@react.component
let make = (
  ~fieldType: string,
  ~id: option<string>,
  ~options: option<JSON.t>,
  ~onChange: option<JSON.t => unit>,
  ~onReady: option<JSON.t => unit>,
  ~onFocus: option<JSON.t => unit>,
  ~onBlur: option<JSON.t => unit>,
  ~imperativeRef: Nullable.t<React.ref<cardFieldHandle>>=Nullable.null,
) => {
  let cardFormCtx = React.useContext(Context.cardFormContext)
  let divRef = React.useRef(Nullable.null)
  let handleRef = React.useRef(None)
  let didMountRef = React.useRef(false)

  let resolvedId = id->Option.getOr(fieldType)
  let containerId = `hyper-card-field-${resolvedId}`
  let resolvedOptions = options->Option.getOr(Dict.make()->JSON.Encode.object)
  let serializedOptions = resolvedOptions->JSON.stringify

  let bindCallbacks = (handle: fieldHandle) => {
    onChange->Option.forEach(cb => handle.on("change", cb))
    onReady->Option.forEach(cb => handle.on("ready", cb))
    onFocus->Option.forEach(cb => handle.on("focus", cb))
    onBlur->Option.forEach(cb => handle.on("blur", cb))
  }

  React.useEffect(() => {
    if cardFormCtx.isReady {
      let handle = switch handleRef.current {
      | Some(existingHandle) => existingHandle
      | None =>
        let createdHandle = cardFormCtx.createField(fieldType, resolvedOptions)
        handleRef.current = Some(createdHandle)
        createdHandle
      }
      bindCallbacks(handle)
      handle.mount("#" ++ containerId)
      Some(() => handle.unmount())
    } else {
      None
    }
  }, (cardFormCtx.isReady, containerId))

  React.useEffectOnEveryRender(() => {
    handleRef.current->Option.forEach(bindCallbacks)
    None
  })

  React.useEffect(() => {
    if didMountRef.current {
      handleRef.current->Option.forEach(handle => handle.update(resolvedOptions))
    } else {
      didMountRef.current = true
    }
    None
  }, [serializedOptions])

  React.useImperativeHandle0(imperativeRef, (): cardFieldHandle => {
    mount: selector => handleRef.current->Option.forEach(handle => handle.mount(selector)),
    unmount: () => handleRef.current->Option.forEach(handle => handle.unmount()),
    destroy: () => handleRef.current->Option.forEach(handle => handle.destroy()),
    update: updatedOptions =>
      handleRef.current->Option.forEach(handle => handle.update(updatedOptions)),
    focus: () => handleRef.current->Option.forEach(handle => handle.focus()),
    blur: () => handleRef.current->Option.forEach(handle => handle.blur()),
    clear: () => handleRef.current->Option.forEach(handle => handle.clear()),
    on: (eventName, cb) => handleRef.current->Option.forEach(handle => handle.on(eventName, cb)),
  })

  <div ref={divRef->ReactDOM.Ref.domRef} id={containerId} />
}
