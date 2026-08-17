type paymentElementProps = {
  id: string,
  options: JSON.t,
  onChange: option<option<JSON.t> => unit>,
  onReady: option<option<JSON.t> => unit>,
  onFocus: option<option<JSON.t> => unit>,
  onBlur: option<option<JSON.t> => unit>,
  onClick: option<option<JSON.t> => unit>,
  onPaymentComplete: option<option<JSON.t> => unit>,
  onPaymentButtonClick: unit => Promise.t<unit>,
}
