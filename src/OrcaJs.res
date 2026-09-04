type eventData = {
  iframeMounted: bool,
  focusTriggered: bool,
  blurTriggered: bool,
  clickTriggered: bool,
  elementType: string,
  classChange: bool,
  newClassType: string,
}
type event = {key: string, data: eventData}
type eventParam = Event(event) | EventData(eventData) | Empty
type eventHandler = eventParam => unit

module This = {
  type t
  @get
  external iframeElem: t => option<Nullable.t<Dom.element>> = "iframeElem"
}

type paymentElement = {
  on: (string, option<option<JSON.t> => unit>) => unit,
  collapse: unit => unit,
  blur: unit => unit,
  update: JSON.t => unit,
  destroy: unit => unit,
  unmount: unit => unit,
  mount: string => unit,
  focus: unit => unit,
  clear: unit => unit,
  onSDKHandleClick: (unit => Promise.t<unit>) => unit,
}
let defaultPaymentElement = {
  on: (_str, _func) => (),
  collapse: () => (),
  blur: () => (),
  update: _x => (),
  destroy: () => (),
  unmount: () => (),
  mount: _string => (),
  focus: () => (),
  clear: () => (),
  onSDKHandleClick: _ => (),
}

type fieldHandle = {
  mount: string => unit,
  unmount: unit => unit,
  destroy: unit => unit,
  update: JSON.t => unit,
  focus: unit => unit,
  blur: unit => unit,
  clear: unit => unit,
  on: (string, JSON.t => unit) => unit,
}

let defaultFieldHandle = {
  mount: _string => (),
  unmount: () => (),
  destroy: () => (),
  update: _x => (),
  focus: () => (),
  blur: () => (),
  clear: () => (),
  on: (_str, _func) => (),
}

type cardForm = {
  create: (string, JSON.t) => fieldHandle,
  on: (string, JSON.t => unit) => unit,
  confirmPayment: unit => Promise.t<JSON.t>,
  deinit: unit => unit,
  update: JSON.t => unit,
  fields: ref<JSON.t>,
}

type vaultCardForm = {
  create: (string, JSON.t) => fieldHandle,
  on: (string, JSON.t => unit) => unit,
  tokenize: unit => Promise.t<JSON.t>,
  deinit: unit => unit,
  update: JSON.t => unit,
  fields: ref<JSON.t>,
}

type paymentMethodsSession = {
  createCardForm: unit => vaultCardForm,
  update: JSON.t => unit,
  on: (string, JSON.t => unit) => unit,
  deinit: unit => unit,
  fields: ref<JSON.t>,
}

type element = {
  getElement: string => option<paymentElement>,
  update: JSON.t => unit,
  fetchUpdates: unit => Promise.t<JSON.t>,
  create: (string, JSON.t) => paymentElement,
  updateIntent: (unit => promise<JSON.t>) => promise<JSON.t>,
  createCardForm: unit => cardForm,
}

type confirmParams = {return_url: string}

type confirmPaymentParams = {
  elements: JSON.t,
  confirmParams: Nullable.t<confirmParams>,
}

type getCustomerSavedPaymentMethods = {
  getCustomerDefaultSavedPaymentMethodData: unit => JSON.t,
  getCustomerLastUsedPaymentMethodData: unit => JSON.t,
  confirmWithCustomerDefaultPaymentMethod: JSON.t => Promise.t<JSON.t>,
  confirmWithLastUsedPaymentMethod: JSON.t => Promise.t<JSON.t>,
}

type initPaymentSession = {
  getCustomerSavedPaymentMethods: option<JSON.t> => Promise.t<JSON.t>,
  updateIntent: (unit => promise<JSON.t>) => promise<JSON.t>,
}

type switchInstance = {
  confirmPayment: JSON.t => Promise.t<JSON.t>,
  elements: JSON.t => element,
  confirmCardPayment: (string, option<JSON.t>, option<JSON.t>) => Promise.t<JSON.t>,
  retrievePaymentIntent: string => Promise.t<JSON.t>,
  paymentRequest: JSON.t => JSON.t,
  initPaymentSession: JSON.t => initPaymentSession,
  paymentMethodsManagementElements: JSON.t => element,
  completeUpdateIntent: string => promise<JSON.t>,
  initiateUpdateIntent: unit => promise<JSON.t>,
  confirmTokenization: JSON.t => Promise.t<JSON.t>,
  paymentMethodsSession: JSON.t => paymentMethodsSession,
}

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

type paymentElementHandle = {confirmPayment: JSON.t => Promise.t<JSON.t>}
type cardFormHandle = {
  confirmPayment: unit => Promise.t<JSON.t>,
  tokenize: unit => Promise.t<JSON.t>,
  update: JSON.t => unit,
  deinit: unit => unit,
  on: (string, JSON.t => unit) => unit,
  getFields: unit => JSON.t,
}

type cardFieldHandle = {
  mount: string => unit,
  unmount: unit => unit,
  destroy: unit => unit,
  update: JSON.t => unit,
  focus: unit => unit,
  blur: unit => unit,
  clear: unit => unit,
  on: (string, JSON.t => unit) => unit,
}

type cardFormProps = {
  children: React.element,
  onChange: option<JSON.t => unit>,
  onReady: option<JSON.t => unit>,
}

type cardFieldProps = {
  id: option<string>,
  options: option<JSON.t>,
  onChange: option<JSON.t => unit>,
  onReady: option<JSON.t => unit>,
  onFocus: option<JSON.t => unit>,
  onBlur: option<JSON.t => unit>,
}

let makeErrorResponse = (code: string, message: string): JSON.t => {
  let errorDict = Dict.make()
  errorDict->Dict.set("code", code->JSON.Encode.string)
  errorDict->Dict.set("message", message->JSON.Encode.string)
  let resultDict = Dict.make()
  resultDict->Dict.set("status", "error"->JSON.Encode.string)
  resultDict->Dict.set("error", errorDict->JSON.Encode.object)
  resultDict->JSON.Encode.object
}

let sdkNotReadyError = (): JSON.t =>
  makeErrorResponse(
    "sdk_not_ready",
    "Hyper is not initialized yet — the card form is not ready",
  )

let unsupportedOnSurfaceError = (~method: string, ~surface: string, ~alternative: string): JSON.t =>
  makeErrorResponse(
    "unsupported_on_surface",
    `${method}() is not available on the ${surface} surface — use ${alternative}()`,
  )
