type eventData = {
  iframeMounted: bool,
  focusTriggered: bool,
  blurTriggered: bool,
  clickTriggered: bool,
  elementType: string,
  classChange: bool,
  newClassType: string,
}
let useHyper: unit => Context.switchContextType
let useStripe: unit => Context.switchContextType
let useWidgets: unit => Context.elementsType
let useElements: unit => Context.elementsType
let usePaymentSession: unit => Context.paymentSessionContextType
let initPaymentSession: (
  promise<OrcaJs.switchInstance>,
  RescriptCore.JSON.t,
) => promise<OrcaJs.initPaymentSession>
let \"Elements": Elements.props<
  React.element,
  RescriptCore.Promise.t<OrcaJs.switchInstance>,
  RescriptCore.JSON.t,
> => React.element
let \"HyperElements": HyperElements.props<
  React.element,
  RescriptCore.Promise.t<OrcaJs.switchInstance>,
  RescriptCore.JSON.t,
> => React.element
let \"PaymentElement": React.component<{
  "id": string,
  "options": RescriptCore.JSON.t,
  "onChange": option<option<RescriptCore.JSON.t> => unit>,
  "onReady": option<option<RescriptCore.JSON.t> => unit>,
  "onFocus": option<option<RescriptCore.JSON.t> => unit>,
  "onBlur": option<option<RescriptCore.JSON.t> => unit>,
  "onClick": option<option<RescriptCore.JSON.t> => unit>,
  "onPaymentComplete": option<option<RescriptCore.JSON.t> => unit>,
  "onPaymentButtonClick": unit => RescriptCore.Promise.t<unit>,
}>
let \"UnifiedCheckout": React.component<{
  "id": string,
  "options": RescriptCore.JSON.t,
  "onChange": option<option<RescriptCore.JSON.t> => unit>,
  "onReady": option<option<RescriptCore.JSON.t> => unit>,
  "onFocus": option<option<RescriptCore.JSON.t> => unit>,
  "onBlur": option<option<RescriptCore.JSON.t> => unit>,
  "onClick": option<option<RescriptCore.JSON.t> => unit>,
  "onPaymentComplete": option<option<RescriptCore.JSON.t> => unit>,
  "onPaymentButtonClick": unit => RescriptCore.Promise.t<unit>,
}>
let \"CardElement": CardElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardWidget": CardElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardNumberElement": CardNumber.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardNumberWidget": CardNumber.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardCVCElement": CardCVC.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardCVCWidget": CardCVC.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardExpiryElement": CardExpiry.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"CardExpiryWidget": CardExpiry.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"GooglePayElement": GooglePayElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"ApplePayElement": ApplePayElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element

let \"PazeElement": PazeElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"PayPalElement": PayPalElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"ExpressCheckoutElement": ExpressCheckoutElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  unit => RescriptCore.Promise.t<unit>,
> => React.element
let \"HyperManagementElements": HyperManagementElements.props<
  React.element,
  RescriptCore.Promise.t<OrcaJs.switchInstance>,
  RescriptCore.JSON.t,
> => React.element
let \"PaymentMethodsManagementElement": PaymentMethodsManagementElement.props<
  string,
  RescriptCore.JSON.t,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  string,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
  option<option<RescriptCore.JSON.t> => unit>,
> => Jsx.element
