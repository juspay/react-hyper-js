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
let useHyperManagement: unit => Context.paymentMethodsManagementSwitchContextType
let useWidgets: unit => Context.elementsType
let useElements: unit => Context.elementsType
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
let \"PaymentElement": PaymentElement.props<
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
let \"UnifiedCheckout": PaymentElement.props<
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
  RescriptCore.Promise.t<OrcaJs.managementSwitchInstance>,
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
