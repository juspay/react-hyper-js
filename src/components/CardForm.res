open OrcaJs

let make = React.forwardRef((
  {children, onReady, onUnready, onError, onConfirmDispatched}: cardFormProps,
  imperativeRef,
) => {
  let elementsState = React.useContext(Context.elementsContext)
  let sessionState = React.useContext(Context.paymentMethodsSessionContext)
  let createdRef = React.useRef(false)
  let (cardFormValue, setCardFormValue) = React.useState(() => Context.defaultCardFormContext)

  React.useEffect(() => {
    if !createdRef.current {
      if sessionState.isPresent {
        sessionState.session->Option.forEach(
          session => {
            let group = session.cardForm()
            createdRef.current = true
            setCardFormValue(_ => {
              createField: group.create,
              confirmPayment: () =>
                Promise.resolve(
                  unsupportedOnSurfaceError(
                    ~method="confirmPayment",
                    ~surface="vault",
                    ~alternative="tokenize",
                  ),
                ),
              tokenize: group.tokenize,
              on: group.on,
              update: group.update,
              deinit: group.deinit,
              getFields: () => group.fields.contents,
              isReady: true,
            })
          },
        )
      } else if elementsState.isReady {
        let group = elementsState.cardForm()
        createdRef.current = true
        setCardFormValue(_ => {
          createField: group.create,
          confirmPayment: group.confirmPayment,
          tokenize: () =>
            Promise.resolve(
              unsupportedOnSurfaceError(
                ~method="tokenize",
                ~surface="payments",
                ~alternative="confirmPayment",
              ),
            ),
          on: group.on,
          update: group.update,
          deinit: group.deinit,
          getFields: () => group.fields.contents,
          isReady: true,
        })
      }
    }
    None
  }, (elementsState, sessionState))

  React.useEffectOnEveryRender(() => {
    if cardFormValue.isReady {
      onReady->Option.forEach(cb => cardFormValue.on("ready", cb))
      onUnready->Option.forEach(cb => cardFormValue.on("unready", cb))
      onError->Option.forEach(cb => cardFormValue.on("error", cb))
      onConfirmDispatched->Option.forEach(cb => cardFormValue.on("confirmDispatched", cb))
    }
    None
  })

  React.useImperativeHandle(
    imperativeRef,
    (): cardFormHandle => {
      confirmPayment: cardFormValue.confirmPayment,
      tokenize: cardFormValue.tokenize,
      update: cardFormValue.update,
      deinit: cardFormValue.deinit,
      on: cardFormValue.on,
      getFields: cardFormValue.getFields,
    },
    [cardFormValue],
  )

  <Context.CardFormContextProvider value={cardFormValue}>
    {children}
  </Context.CardFormContextProvider>
})
