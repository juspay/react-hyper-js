let make = React.forwardRef((
  {
    id,
    options,
    onChange,
    onReady,
    onFocus,
    onBlur,
    onClick,
    onPaymentComplete,
    onPaymentButtonClick,
  }: OrcaJs.paymentElementProps,
  ref_,
) => {
  <PaymentElementsWrapper
    id
    options
    onChange
    onReady
    onFocus
    onBlur
    onClick
    componentType="payment"
    onPaymentComplete
    onPaymentButtonClick
    imperativeRef=ref_
  />
})
