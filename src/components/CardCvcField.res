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
    fieldType="cardCvc"
    id
    options
    onChange
    onReady
    onFocus
    onBlur
    imperativeRef
  />
})
