@react.component
let make = (~children, ~hyper: Promise.t<OrcaJs.switchInstance>, ~options: JSON.t) => {
  let (sessionState, setSessionState) = React.useState(() =>
    Context.pendingPaymentMethodSessionContext
  )

  React.useEffect(() => {
    Promise.all2((hyper, options->Utils.normalizeToPromise))
    ->Promise.then(((switchInstance: OrcaJs.switchInstance, resolvedOptions)) => {
      let session = switchInstance.initPaymentMethodSession(resolvedOptions)
      let newSessionValues: Context.paymentMethodSessionContextType = {
        session: Some(session),
        isPresent: true,
      }
      setSessionState(_ => newSessionValues)
      Promise.resolve(newSessionValues)
    })
    ->Promise.catch(err => {
      Console.error2("[HyperPaymentMethodSession] Failed to initialise hyper promise:", err)
      Promise.resolve(Context.pendingPaymentMethodSessionContext)
    })
    ->ignore
    None
  }, (hyper, options))

  <Context.PaymentMethodSessionContextProvider value={sessionState}>
    {children}
  </Context.PaymentMethodSessionContextProvider>
}
