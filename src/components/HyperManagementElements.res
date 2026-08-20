@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let (switchState, setSwitchState) = React.useState(() => Context.defaultSwitchContext)
  let (elementsState, setElementsState) = React.useState(() =>
    Context.defaultPaymentMethodsManagementElementsContext
  )

  React.useEffect(() => {
    Promise.all2((hyper, options->Utils.normalizeToPromise))
    ->Promise.then(((switchInstance: OrcaJs.switchInstance, resolvedOptions)) => {
      let paymentMethodsManagementElementOptions =
        resolvedOptions->Context.paymentMethodsManagementElementsOptionObjMapper
      let orcaElementsConfig = switchInstance.paymentMethodsManagementElements(resolvedOptions)
      let newElemValues: Context.paymentMethodsManagementElementsType = {
        options: paymentMethodsManagementElementOptions,
        update: orcaElementsConfig.update,
        getElement: orcaElementsConfig.getElement,
        fetchUpdates: orcaElementsConfig.fetchUpdates,
        create: orcaElementsConfig.create,
      }

      let switchValClone: Context.switchContextType = {
        confirmPayment: switchInstance.confirmPayment,
        confirmCardPayment: switchInstance.confirmCardPayment,
        retrievePaymentIntent: switchInstance.retrievePaymentIntent,
        clientSecret: "",
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
      Console.error2("[HyperManagementElements] Failed to initialise hyper promise:", err)
      Promise.resolve(Context.defaultSwitchContext)
    })
    ->ignore
    None
  }, (hyper, options))

  <Context.PaymentMethodsManagementSwitchContextProvider value={switchState}>
    <Context.PaymentMethodsManagementElementsContextProvider value={elementsState}>
      {children}
    </Context.PaymentMethodsManagementElementsContextProvider>
  </Context.PaymentMethodsManagementSwitchContextProvider>
}
