open OrcaJs

let make = React.forwardRef((
  {
    id,
    options,
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
    onChange
    onReady
    onFocus
    onBlur
    imperativeRef
  />
})
