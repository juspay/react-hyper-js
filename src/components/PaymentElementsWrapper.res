@react.component
let make = (
  ~id="payment-Element",
  ~options: JSON.t,
  ~onChange,
  ~onReady,
  ~componentType: string,
  ~onFocus,
  ~onBlur,
  ~onClick,
  ~onPaymentComplete,
  ~onPaymentButtonClick,
) => {
  let hyperSwitch = React.useContext(Context.switchContext)
  let elementsState = React.useContext(Context.elementsContext)
  let divRef = React.useRef(Nullable.null)

  let paymentElement = elementsState.create(componentType, options)

  React.useEffect2(() => {
    let paymentElement = elementsState.create(componentType, options)
    paymentElement.mount(`#orca-elements-payment-element-${id}`)
    None
  }, (divRef, elementsState))

  React.useEffect2(() => {
    paymentElement.on("ready", onReady)
    paymentElement.on("focus", onFocus)
    paymentElement.on("blur", onBlur)
    paymentElement.on("clickTriggered", onClick)
    paymentElement.on("change", onChange)
    paymentElement.on("completeDoThis", onPaymentComplete)
    paymentElement.onSDKHandleClick(onPaymentButtonClick)

    None
  }, (elementsState, hyperSwitch))

  <div ref={divRef->ReactDOM.Ref.domRef} id={`orca-elements-payment-element-${id}`} />
}
