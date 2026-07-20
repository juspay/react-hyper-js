let make = React.forwardRef((
  props: {
    "id": string,
    "options": JSON.t,
    "onChange": option<option<JSON.t> => unit>,
    "onReady": option<option<JSON.t> => unit>,
    "onFocus": option<option<JSON.t> => unit>,
    "onBlur": option<option<JSON.t> => unit>,
    "onClick": option<option<JSON.t> => unit>,
    "onPaymentComplete": option<option<JSON.t> => unit>,
    "onPaymentButtonClick": unit => Promise.t<unit>,
  },
  ref_,
) => {
  <PaymentElementsWrapper
    id=props["id"]
    options=props["options"]
    onChange=props["onChange"]
    onReady=props["onReady"]
    onFocus=props["onFocus"]
    onBlur=props["onBlur"]
    onClick=props["onClick"]
    componentType="payment"
    onPaymentComplete=props["onPaymentComplete"]
    onPaymentButtonClick=props["onPaymentButtonClick"]
    imperativeRef=ref_
  />
})
