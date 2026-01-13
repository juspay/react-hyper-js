type eventData = {
  iframeMounted: bool,
  focusTriggered: bool,
  blurTriggered: bool,
  clickTriggered: bool,
  elementType: string,
  classChange: bool,
  newClassType: string,
}

let useHyper = () => {
  React.useContext(Context.switchContext)
}

let useStripe = () => {
  Console.warn("useStripe() is deprecated. Use useHyper() instead")
  useHyper()
}
let useWidgets = () => {
  React.useContext(Context.elementsContext)
}
let useElements = () => {
  Console.warn("useElements() is deprecated. Use useWidgets() instead")
  useWidgets()
}

let \"Elements" = Elements.make

let \"HyperElements" = HyperElements.make

let \"PaymentElement" = PaymentElement.make
let \"UnifiedCheckout" = PaymentElement.make

let \"CardElement" = CardElement.make
let \"CardWidget" = CardElement.make

let \"CardNumberElement" = CardNumber.make
let \"CardNumberWidget" = CardNumber.make

let \"CardCVCElement" = CardCVC.make
let \"CardCVCWidget" = CardCVC.make

let \"CardExpiryElement" = CardExpiry.make
let \"CardExpiryWidget" = CardExpiry.make

let \"GooglePayElement" = GooglePayElement.make

let \"ApplePayElement" = ApplePayElement.make

let \"PazeElement" = PazeElement.make

let \"PayPalElement" = PayPalElement.make

let \"ExpressCheckoutElement" = ExpressCheckoutElement.make

let \"HyperManagementElements" = HyperManagementElements.make

let \"PaymentMethodsManagementElement" = PaymentMethodsManagementElement.make
