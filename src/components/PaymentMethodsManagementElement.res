open OrcaJs

let make = React.forwardRef((
  {
    id,
    options,
    onChange,
    onReady,
    componentType,
    onFocus,
    onBlur,
    onClick,
  }: paymentMethodsManagementElementProps,
  imperativeRef,
) => {
  <PaymentMethodsManagementElementWrapper
    ?id
    options
    onChange
    onReady
    ?componentType
    onFocus
    onBlur
    onClick
    imperativeRef
  />
})
