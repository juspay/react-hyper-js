@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let elementOptions = options->Context.elementsOptionObjMapper
  let (switchState, setSwitchState) = React.useState(() => Context.defaultSwitchContext)
  let (elementsState, setElementsState) = React.useState(() => Context.defaultElementsContext)
  let (paymentSessionState, setPaymentSessionState) = React.useState(() =>
    Context.defaultPaymentSessionContext
  )

  React.useEffect0(() => {
    hyper
    ->(Js.Promise.then_((switchInstance: OrcaJs.switchInstance) => {
      let orcaElementsConfig = switchInstance.elements(options)
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

      let paymentSession = switchInstance.initPaymentSession(options)
      let newPaymentSessionValues: Context.paymentSessionContextType = {
        getCustomerSavedPaymentMethods: paymentSession.getCustomerSavedPaymentMethods,
        updateIntent: paymentSession.updateIntent,
      }

      setSwitchState(_ => switchValClone)
      setElementsState(_ => newElemValues)
      setPaymentSessionState(_ => newPaymentSessionValues)
      Promise.resolve(switchValClone)
    }, _))
    ->ignore
    None
  })

  <Context.SwitchContextProvider value={switchState}>
    <Context.ElementsContextProvider value={elementsState}>
      <Context.PaymentSessionContextProvider value={paymentSessionState}>
        {children}
      </Context.PaymentSessionContextProvider>
    </Context.ElementsContextProvider>
  </Context.SwitchContextProvider>
}
