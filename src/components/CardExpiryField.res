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
    fieldType="cardExpiry"
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
