@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let elementOptions = options->Context.elementsOptionObjMapper
  let (switchState, setSwitchState) = React.useState(() => Context.defaultSwitchContext)
  let (elementsState, setElementsState) = React.useState(() => Context.defaultElementsContext)

  React.useEffect0(() => {
    hyper
    ->Js.Promise.then_((switchInstance: OrcaJs.switchInstance) => {
      let orcaElementsConfig = switchInstance.elements(options)
      let newElemValues: Context.elementsType = {
        options: elementOptions,
        update: orcaElementsConfig.update,
        getElement: orcaElementsConfig.getElement,
        fetchUpdates: orcaElementsConfig.fetchUpdates,
        create: orcaElementsConfig.create,
      }
      let switchValClone: Context.switchContextType = {
        confirmPayment: switchInstance.confirmPayment,
        confirmCardPayment: switchInstance.confirmCardPayment,
        retrievePaymentIntent: switchInstance.retrievePaymentIntent,
        clientSecret: elementOptions.clientSecret,
        paymentRequest: switchInstance.paymentRequest,
        completeUpdateIntent: switchInstance.completeUpdateIntent,
        initiateUpdateIntent: switchInstance.initiateUpdateIntent,
      }

      setSwitchState(_ => switchValClone)
      setElementsState(_ => newElemValues)
      Promise.resolve(switchValClone)
    }, _)
    ->ignore
    None
  })

  <Context.SwitchContextProvider value={switchState}>
    <Context.ElementsContextProvider value={elementsState}>
      {children}
    </Context.ElementsContextProvider>
  </Context.SwitchContextProvider>
}
