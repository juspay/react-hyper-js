open OrcaJs
let make = React.forwardRef((
  {
    id,
    options,
    onChange,
    onReady,
    onResize,
    onFocus,
    onBlur,
    onClick,
    onPaymentComplete,
    onPaymentButtonClick,
  },
  imperativeRef,
) => {
  <PaymentElementsWrapper
    id
    options
    onChange
    onReady
    ?onResize
    onFocus
    onBlur
    onClick
    componentType="payment"
    onPaymentComplete
    onPaymentButtonClick
    imperativeRef
  />
})
