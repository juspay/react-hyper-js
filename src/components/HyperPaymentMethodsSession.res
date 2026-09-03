@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let (sessionState, setSessionState) = React.useState(() =>
    Context.pendingPaymentMethodsSessionContext
  )

  React.useEffect(() => {
    Promise.all2((hyper, options->Utils.normalizeToPromise))
    ->Promise.then(((switchInstance: OrcaJs.switchInstance, resolvedOptions)) => {
      let session = switchInstance.paymentMethodsSession(resolvedOptions)
      let newSessionValues: Context.paymentMethodsSessionContextType = {
        session: Some(session),
        isPresent: true,
      }
      setSessionState(_ => newSessionValues)
      Promise.resolve(newSessionValues)
    })
    ->Promise.catch(err => {
      Console.error2("[HyperPaymentMethodsSession] Failed to initialise hyper promise:", err)
      Promise.resolve(Context.pendingPaymentMethodsSessionContext)
    })
    ->ignore
    None
  }, (hyper, options))

  <Context.PaymentMethodsSessionContextProvider value={sessionState}>
    {children}
  </Context.PaymentMethodsSessionContextProvider>
}
