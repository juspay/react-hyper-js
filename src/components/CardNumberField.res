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
    imperativeRef
  />
})
