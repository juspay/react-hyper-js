open OrcaJs

let make = React.forwardRef((
  {children, onChange, onReady}: cardFormProps,
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
            let group = session.createCardForm()
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
        let group = elementsState.createCardForm()
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
      onChange->Option.forEach(cb => cardFormValue.on("change", cb))
      onReady->Option.forEach(cb => cardFormValue.on("ready", cb))
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
