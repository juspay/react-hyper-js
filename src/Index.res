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

let usePaymentSession = () => {
  React.useContext(Context.paymentSessionContext)
}

let initPaymentSession = async (hyperPromise: promise<OrcaJs.switchInstance>, options: JSON.t) => {
  let hyper = await hyperPromise
  hyper.initPaymentSession(options)
}
let useWidgets = () => {
  React.useContext(Context.elementsContext)
}
let useCardForm = () => {
  React.useContext(Context.cardFormContext)
}
let usePaymentMethodsSession = () => {
  React.useContext(Context.paymentMethodsSessionContext)
}
let useElements = () => {
  Console.warn("useElements() is deprecated. Use useWidgets() instead")
  useWidgets()
}

let \"Elements" = Elements.make

let \"HyperElements" = HyperElements.make

let \"HyperPaymentMethodsSession" = HyperPaymentMethodsSession.make

let \"CardForm" = CardForm.make

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

let \"CardNumberField" = CardNumberField.make

let \"CardExpiryField" = CardExpiryField.make

let \"CardCVCField" = CardCvcField.make

let \"GooglePayElement" = GooglePayElement.make

let \"ApplePayElement" = ApplePayElement.make

let \"PazeElement" = PazeElement.make

let \"PayPalElement" = PayPalElement.make

let \"ExpressCheckoutElement" = ExpressCheckoutElement.make

let \"HyperManagementElements" = HyperManagementElements.make

let \"PaymentMethodsManagementElement" = PaymentMethodsManagementElement.make
