@react.component
let make = (
  ~id,
  ~options: JSON.t,
  ~onChange,
  ~onReady,
  ~onFocus,
  ~onBlur,
  ~onClick,
  ~onPaymentComplete,
  ~onPaymentButtonClick,
) => {
  <PaymentElementsWrapper
    id
    options
    onChange
    onReady
    onFocus
    onBlur
    onClick
    componentType="expressCheckout"
    onPaymentComplete
    onPaymentButtonClick
  />
}
