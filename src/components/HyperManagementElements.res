@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let paymentMethodsManagementElementOptions =
    options->Context.paymentMethodsManagementElementsOptionObjMapper
  let (switchState, setSwitchState) = React.useState(() =>
    Context.defaultPaymentMethodsManagementSwitchContext
  )
  let (elementsState, setElementsState) = React.useState(() =>
    Context.defaultPaymentMethodsManagementElementsContext
  )

  React.useEffect0(() => {
    hyper
    ->(Js.Promise.then_((switchInstance: OrcaJs.switchInstance) => {
      let orcaElementsConfig = switchInstance.paymentMethodsManagementElements(options)
      let newElemValues: Context.paymentMethodsManagementElementsType = {
        options: paymentMethodsManagementElementOptions,
        update: orcaElementsConfig.update,
        getElement: orcaElementsConfig.getElement,
        fetchUpdates: orcaElementsConfig.fetchUpdates,
        create: orcaElementsConfig.create,
      }

      let switchValClone: Context.paymentMethodsManagementSwitchContextType = {
        paymentRequest: switchInstance.paymentRequest,
        ephemeralKey: paymentMethodsManagementElementOptions.ephemeralKey,
      }
      setSwitchState(_ => switchValClone)
      setElementsState(_ => newElemValues)
      Promise.resolve(switchValClone)
    }, _))
    ->ignore
    None
  })

  <Context.PaymentMethodsManagementSwitchContextProvider value={switchState}>
    <Context.PaymentMethodsManagementElementsContextProvider value={elementsState}>
      {children}
    </Context.PaymentMethodsManagementElementsContextProvider>
  </Context.PaymentMethodsManagementSwitchContextProvider>
}
