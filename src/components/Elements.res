@react.component
let make = (~children, ~stripe: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let (switchState, setSwitchState) = React.useState(() => Context.defaultSwitchContext)
  let (elementsState, setElementsState) = React.useState(() => Context.defaultElementsContext)

  React.useEffect(() => {
    Promise.all2((stripe, options->Utils.normalizeToPromise))
    ->Promise.then(((switchInstance: OrcaJs.switchInstance, resolvedOptions)) => {
      let elementOptions = resolvedOptions->Context.elementsOptionObjMapper
      let orcaElementsConfig = switchInstance.elements(resolvedOptions)
      let newElemValues: Context.elementsType = {
        options: elementOptions,
        update: orcaElementsConfig.update,
        getElement: orcaElementsConfig.getElement,
        fetchUpdates: orcaElementsConfig.fetchUpdates,
        create: orcaElementsConfig.create,
        updateIntent: orcaElementsConfig.updateIntent,
      }
      let switchValClone: Context.switchContextType = {
        confirmPayment: switchInstance.confirmPayment,
        confirmCardPayment: switchInstance.confirmCardPayment,
        retrievePaymentIntent: switchInstance.retrievePaymentIntent,
        clientSecret: elementOptions.clientSecret,
        paymentRequest: switchInstance.paymentRequest,
        initPaymentSession: switchInstance.initPaymentSession,
        completeUpdateIntent: switchInstance.completeUpdateIntent,
        initiateUpdateIntent: switchInstance.initiateUpdateIntent,
        confirmTokenization: switchInstance.confirmTokenization,
      }
      setSwitchState(_ => switchValClone)
      setElementsState(_ => newElemValues)
      Promise.resolve(switchValClone)
    })
    ->Promise.catch(err => {
      Console.error2("[Elements] Failed to initialise hyper promise:", err)
      Promise.resolve(Context.defaultSwitchContext)
    })
    ->ignore
    None
  }, (stripe, options))

  <Context.SwitchContextProvider value={switchState}>
    <Context.ElementsContextProvider value={elementsState}>
      {children}
    </Context.ElementsContextProvider>
  </Context.SwitchContextProvider>
}
