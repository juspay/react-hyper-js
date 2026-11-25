@react.component
let make = (
  ~id="",
  ~options: JSON.t,
  ~onChange,
  ~onReady,
  ~componentType="paymentMethodsManagement",
  ~onFocus,
  ~onBlur,
  ~onClick,
) => {
  let paymentMethodsManagementState = React.useContext(
    Context.paymentMethodsManagementElementsContext,
  )
  let divRef = React.useRef(Nullable.null)

  let widgetRef = React.useRef((None: option<OrcaJs.paymentElement>))
  let lastOptions = React.useRef("")
  let mountId = Utils.useWidgetId(id)
  React.useEffect3(() => {
    if mountId === "" {
      None
    } else {
      let widget = paymentMethodsManagementState.create(componentType, options)
      widgetRef.current = Some(widget)
      lastOptions.current = JSON.stringify(options)
      widget.mount(`#orca-elements-payment-management-${mountId}`)
      Some(
        () => {
          widget.destroy()
          widgetRef.current = None
        },
      )
    }
  }, (paymentMethodsManagementState, componentType, mountId))

  React.useEffect(() => {
    widgetRef.current->Option.forEach(widget => {
      widget.on("ready", onReady)
      widget.on("focus", onFocus)
      widget.on("blur", onBlur)
      widget.on("clickTriggered", onClick)
      widget.on("change", onChange)
    })
    None
  }, (
    paymentMethodsManagementState,
    componentType,
    mountId,
    onReady,
    onFocus,
    onBlur,
    onClick,
    onChange,
  ))

  React.useEffect(() => {
    let serializedOptions = JSON.stringify(options)
    if serializedOptions !== lastOptions.current {
      widgetRef.current->Option.forEach(widget => widget.update(options))
      lastOptions.current = serializedOptions
    }
    None
  }, (paymentMethodsManagementState, componentType, mountId, options))

  let containerId = mountId === "" ? None : Some(`orca-elements-payment-management-${mountId}`)
  <div ref={divRef->ReactDOM.Ref.domRef} id=?containerId />
}
