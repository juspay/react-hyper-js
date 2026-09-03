open OrcaJs

let make = React.forwardRef((
  {
    id,
    options,
    className,
    onChange,
    onReady,
    onFocus,
    onBlur,
    onError,
  }: cardFieldProps,
  imperativeRef,
) => {
  <CardFieldWrapper
    fieldType="cardNumber"
    id
    options
    className
    onChange
    onReady
    onFocus
    onBlur
    onError
    imperativeRef
  />
})
