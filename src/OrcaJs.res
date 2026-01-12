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

type element = {
  getElement: string => option<paymentElement>,
  update: JSON.t => unit,
  fetchUpdates: unit => Promise.t<JSON.t>,
  create: (string, JSON.t) => paymentElement,
}

type confirmParams = {return_url: string}

type confirmPaymentParams = {
  elements: JSON.t,
  confirmParams: Nullable.t<confirmParams>,
}

type switchInstance = {
  confirmPayment: JSON.t => Promise.t<JSON.t>,
  elements: JSON.t => element,
  confirmCardPayment: (string, option<JSON.t>, option<JSON.t>) => Promise.t<JSON.t>,
  retrievePaymentIntent: string => Promise.t<JSON.t>,
  paymentRequest: JSON.t => JSON.t,
  paymentMethodsManagementElements: JSON.t => element,
  completeUpdateIntent: string => promise<JSON.t>,
  initiateUpdateIntent: unit => promise<JSON.t>,
}

type managementSwitchInstance = {
  paymentMethodsManagementElements: JSON.t => element,
  elements: JSON.t => element,
  paymentRequest: JSON.t => JSON.t,
  confirmTokenization: JSON.t => Promise.t<JSON.t>,
}
