let make = React.forwardRef((props: Types.paymentElementProps, ref_) => {
  <PaymentElementsWrapper
    id={props.id}
    options={props.options}
    onChange={props.onChange}
    onReady={props.onReady}
    onFocus={props.onFocus}
    onBlur={props.onBlur}
    onClick={props.onClick}
    componentType="payment"
    onPaymentComplete={props.onPaymentComplete}
    onPaymentButtonClick={props.onPaymentButtonClick}
    imperativeRef=ref_
  />
})
