@get
external contentWindow: Nullable.t<Dom.element> => Nullable.t<Dom.element> = "contentWindow"
@send
external postMessage: (Nullable.t<Dom.element>, string, string) => unit = "postMessage"
external jsonToRef: JSON.t => React.ref<Nullable.t<Dom.element>> = "%identity"
@get external getClientSecret: 'a => string = "clientSecret"
external toJson: 'b => JSON.t = "%identity"
type func = unit => string
external toFunc: 'c => func = "%identity"

type paymentElement

type address = {
  city: option<string>,
  country: option<string>,
  line1: option<string>,
  line2: option<string>,
  postal_code: option<string>,
  state: option<string>,
}
type confirmCardPaymentMethodType = String(string) | Obj(JSON.t)
type shipping = {
  address: address,
  name: string,
  carrier: option<string>,
  phone: option<string>,
  tracking_number: option<string>,
}
type paymentMethodOptionsCard = {
  cvc: React.element,
  network: string,
}
type paymentMethodOptions = {card: paymentMethodOptionsCard}
type confirmCardPaymentDataType = {
  payment_method: confirmCardPaymentMethodType,
  shipping: shipping,
  return_url: string,
  receipt_email: string,
  setup_future_usage: string,
  payment_method_options: string,
}
type elementsOptions = {
  fonts: array<JSON.t>,
  locale: string,
  clientSecret: string,
  appearance: Dict.t<JSON.t>,
  loader: string,
}
type paymentMethodsManagementElementsOptions = {
  fonts: array<JSON.t>,
  locale: string,
  ephemeralKey: string,
  appearance: Dict.t<JSON.t>,
  loader: string,
}
external optionsToJson: elementsOptions => JSON.t = "%identity"
type rec elementsType = {
  options: elementsOptions,
  update: JSON.t => unit,
  getElement: string => option<OrcaJs.paymentElement>,
  fetchUpdates: unit => Promise.t<JSON.t>,
  create: (string, JSON.t) => OrcaJs.paymentElement, // return a react component instead by doing new Payment Element.
}

type rec paymentMethodsManagementElementsType = {
  options: paymentMethodsManagementElementsOptions,
  update: JSON.t => unit,
  getElement: string => option<OrcaJs.paymentElement>,
  fetchUpdates: unit => Promise.t<JSON.t>,
  create: (string, JSON.t) => OrcaJs.paymentElement,
}

type elementsContextType = {options: Dict.t<JSON.t>}
type confirmPaymentParams = {return_url: string}
type switchContextType = {
  clientSecret: string,
  confirmPayment: JSON.t => Promise.t<JSON.t>,
  confirmCardPayment: (string, option<JSON.t>, option<JSON.t>) => Promise.t<JSON.t>,
  retrievePaymentIntent: string => Promise.t<JSON.t>,
  paymentRequest: JSON.t => JSON.t,
  completeUpdateIntent: string => promise<JSON.t>,
  initiateUpdateIntent: unit => promise<JSON.t>,
  confirmTokenization: JSON.t => Promise.t<JSON.t>,
}

type paymentMethodsManagementSwitchContextType = {
  ephemeralKey: string,
  paymentRequest: JSON.t => JSON.t,
}

let confirmPaymentFn = (_elements: JSON.t) => {
  Promise.resolve(Dict.make()->JSON.Encode.object)
}

let confirmTokenizationFn = (_elements: JSON.t) => {
  Promise.resolve(Dict.make()->JSON.Encode.object)
}

let confirmCardPaymentFn = (
  _clientSecretId: string,
  _data: option<JSON.t>,
  _options: option<JSON.t>,
) => {
  Promise.resolve(Dict.make()->JSON.Encode.object)
}

let retrievePaymentIntentFn = _paymentIntentId => {
  Promise.resolve(Dict.make()->JSON.Encode.object)
}
let paymentRequest = options => {
  options
}

let defaultSwitchContext = {
  clientSecret: "",
  confirmPayment: confirmPaymentFn,
  confirmCardPayment: confirmCardPaymentFn,
  retrievePaymentIntent: retrievePaymentIntentFn,
  paymentRequest,
  completeUpdateIntent: _ => Promise.resolve(Dict.make()->JSON.Encode.object),
  initiateUpdateIntent: _ => Promise.resolve(Dict.make()->JSON.Encode.object),
  confirmTokenization: confirmTokenizationFn,
}

let switchContext = React.createContext(defaultSwitchContext)

module SwitchContextProvider = {
  let make = React.Context.provider(switchContext)
}

let defaultPaymentMethodsManagementSwitchContext = {
  ephemeralKey: "",
  paymentRequest,
}

let paymentMethodsManagementSwitchContext = React.createContext(
  defaultPaymentMethodsManagementSwitchContext,
)

module PaymentMethodsManagementSwitchContextProvider = {
  let make = React.Context.provider(switchContext)
}

let getString = (dict, key, defaultVal) => {
  dict
  ->Dict.get(key)
  ->Belt.Option.flatMap(JSON.Decode.string)
  ->Option.getOr(defaultVal)
}

let elementsOptionObjMapper = (options: JSON.t) => {
  let dict = options->JSON.Decode.object->Option.getOr(Dict.make())
  {
    fonts: dict
    ->Dict.get("fonts")
    ->Belt.Option.flatMap(JSON.Decode.array)
    ->Option.getOr([]),
    locale: dict->getString("locale", ""),
    clientSecret: dict->getString("clientSecret", ""),
    appearance: dict
    ->Dict.get("appearance")
    ->Belt.Option.flatMap(JSON.Decode.object)
    ->Option.getOr(Dict.make()),
    loader: dict->getString("loader", "auto"),
  }
}

let update = _options => {
  ()
}

let getElement = _componentName => {
  None
}

let fetchUpdates = () => {
  //add API call
  Promise.make((resolve, _) => {
    setTimeout(() => resolve(Dict.make()->JSON.Encode.object), 1000)->ignore
  })
}

let create = (_componentType, _options) => {
  OrcaJs.defaultPaymentElement
}
let defaultElementsContext: elementsType = {
  options: {
    fonts: [],
    locale: "",
    clientSecret: "",
    appearance: Dict.make(),
    loader: "",
  },
  update,
  getElement,
  fetchUpdates,
  create,
}

let elementsContext = React.createContext(defaultElementsContext)

module ElementsContextProvider = {
  let make = React.Context.provider(elementsContext)
}

let paymentMethodsManagementElementsOptionObjMapper = (options: JSON.t) => {
  let dict = options->JSON.Decode.object->Option.getOr(Dict.make())
  {
    fonts: dict
    ->Dict.get("fonts")
    ->Belt.Option.flatMap(JSON.Decode.array)
    ->Option.getOr([]),
    locale: dict->getString("locale", ""),
    ephemeralKey: dict->getString("ephemeralKey", ""),
    appearance: dict
    ->Dict.get("appearance")
    ->Belt.Option.flatMap(JSON.Decode.object)
    ->Option.getOr(Dict.make()),
    loader: dict->getString("loader", "auto"),
  }
}

let defaultPaymentMethodsManagementElementsContext: paymentMethodsManagementElementsType = {
  options: {
    fonts: [],
    locale: "",
    ephemeralKey: "",
    appearance: Dict.make(),
    loader: "",
  },
  update,
  getElement,
  fetchUpdates,
  create,
}

let paymentMethodsManagementElementsContext = React.createContext(
  defaultPaymentMethodsManagementElementsContext,
)

module PaymentMethodsManagementElementsContextProvider = {
  let make = React.Context.provider(paymentMethodsManagementElementsContext)
}
