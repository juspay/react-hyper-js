@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: 'a) => {
  let (switchState, setSwitchState) = React.useState(() => Context.defaultSwitchContext)
  let (elementsState, setElementsState) = React.useState(() => Context.defaultElementsContext)
  let (paymentSessionState, setPaymentSessionState) = React.useState(() =>
    Context.defaultPaymentSessionContext
  )

  React.useEffect(() => {
    Promise.all2((hyper, options->Utils.normalizeToPromise))
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

      let paymentSession = switchInstance.initPaymentSession(resolvedOptions)
      let newPaymentSessionValues: Context.paymentSessionContextType = {
        getCustomerSavedPaymentMethods: paymentSession.getCustomerSavedPaymentMethods,
        updateIntent: paymentSession.updateIntent,
      }

      setSwitchState(_ => switchValClone)
      setElementsState(_ => newElemValues)
      setPaymentSessionState(_ => newPaymentSessionValues)
      Promise.resolve(switchValClone)
    })
    ->Promise.catch(err => {
      Console.warn2("[HyperElements] Failed to initialise hyper promise:", err)
      Promise.resolve(Context.defaultSwitchContext)
    })
    ->ignore
    None
  }, (hyper, options))

  <Context.SwitchContextProvider value={switchState}>
    <Context.ElementsContextProvider value={elementsState}>
      <Context.PaymentSessionContextProvider value={paymentSessionState}>
        {children}
      </Context.PaymentSessionContextProvider>
    </Context.ElementsContextProvider>
  </Context.SwitchContextProvider>
}
