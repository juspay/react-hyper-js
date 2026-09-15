open OrcaJs

@react.component
let make = (
  ~id="payment-management",
  ~options: JSON.t,
  ~onChange,
  ~onReady,
  ~componentType="paymentMethodsManagement",
  ~onFocus,
  ~onBlur,
  ~onClick,
  ~imperativeRef: Nullable.t<React.ref<paymentMethodsManagementElementHandle>>=Nullable.null,
) => {
  let hyperSwitch = React.useContext(Context.switchContext)
  let paymentMethodsManagementState = React.useContext(
    Context.paymentMethodsManagementElementsContext,
  )
  let divRef = React.useRef(Nullable.null)

  let paymentElement = paymentMethodsManagementState.create(componentType, options)

  React.useImperativeHandle1(
    imperativeRef,
    () => {
      confirmTokenization: hyperSwitch.confirmTokenization,
      tokenize: hyperSwitch.tokenize,
    },
    [hyperSwitch],
  )

  React.useEffect(() => {
    let paymentElement = paymentMethodsManagementState.create(componentType, options)
    paymentElement.mount(`#orca-elements-payment-management-${id}`)
    None
  }, (divRef, paymentMethodsManagementState))

  React.useEffect2(() => {
    paymentElement.on("ready", onReady)
    paymentElement.on("focus", onFocus)
    paymentElement.on("blur", onBlur)
    paymentElement.on("clickTriggered", onClick)
    paymentElement.on("change", onChange)

    Some(
      () => {
        paymentElement.on("ready", None)
        paymentElement.on("focus", None)
        paymentElement.on("blur", None)
        paymentElement.on("clickTriggered", None)
        paymentElement.on("change", None)
      },
    )
  }, (paymentMethodsManagementState, hyperSwitch))

  <div ref={divRef->ReactDOM.Ref.domRef} id={`orca-elements-payment-management-${id}`} />
}
