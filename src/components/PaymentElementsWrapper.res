open OrcaJs
@react.component
let make = (
  ~id="",
  ~options: JSON.t,
  ~onChange,
  ~onReady,
  ~onResize=?,
  ~componentType: string,
  ~onFocus,
  ~onBlur,
  ~onClick,
  ~onPaymentComplete,
  ~onPaymentButtonClick,
  ~imperativeRef: Nullable.t<React.ref<paymentElementHandle>>=Nullable.null,
) => {
  let elementsState = React.useContext(Context.elementsContext)
  let divRef = React.useRef(Nullable.null)
  let widgetRef = React.useRef((None: option<paymentElement>))
  let lastOptions = React.useRef("")
  let mountId = Utils.useWidgetId(id)

  React.useImperativeHandle1(
    imperativeRef,
    () => {
      confirmPayment: payload =>
        switch widgetRef.current {
        | Some(widget) => widget.confirmPayment(payload)
        | None => Promise.resolve(sdkNotReadyError())
        },
    },
    [elementsState],
  )

  React.useEffect3(() => {
    if mountId === "" {
      None
    } else {
      let widget = elementsState.create(componentType, options)
      widgetRef.current = Some(widget)
      lastOptions.current = JSON.stringify(options)
      widget.mount(`#orca-elements-payment-element-${mountId}`)
      Some(
        () => {
          widget.destroy()
          widgetRef.current = None
        },
      )
    }
  }, (elementsState, componentType, mountId))

  React.useEffect(() => {
    widgetRef.current->Option.forEach(widget => {
      widget.on("ready", onReady)
      widget.on("resize", onResize)
      widget.on("focus", onFocus)
      widget.on("blur", onBlur)
      widget.on("clickTriggered", onClick)
      widget.on("change", onChange)
      widget.on("completeDoThis", onPaymentComplete)
      widget.onSDKHandleClick(onPaymentButtonClick)
    })
    None
  }, (
    elementsState,
    componentType,
    mountId,
    onReady,
    onResize,
    onFocus,
    onBlur,
    onClick,
    onChange,
    onPaymentComplete,
    onPaymentButtonClick,
  ))

  React.useEffect(() => {
    let serializedOptions = JSON.stringify(options)
    if serializedOptions !== lastOptions.current {
      widgetRef.current->Option.forEach(widget => widget.update(options))
      lastOptions.current = serializedOptions
    }
    None
  }, (elementsState, componentType, mountId, options))

  let containerId = mountId === "" ? None : Some(`orca-elements-payment-element-${mountId}`)
  <div ref={divRef->ReactDOM.Ref.domRef} id=?containerId />
}
