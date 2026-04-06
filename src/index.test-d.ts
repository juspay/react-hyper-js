/**
 * Type tests for @juspay-tech/react-hyper-js
 *
 * These tests exercise every exported type, component, and hook to ensure the
 * declarations in index.d.ts are correct and complete. Run with:
 *
 *   npx tsc --project tsconfig.test.json --noEmit
 *
 * Expected result: 0 errors.
 */

import * as React from "react";

// ---------------------------------------------------------------------------
// 1. Import all exports from @juspay-tech/react-hyper-js
// ---------------------------------------------------------------------------
import {
  // Types
  type SessionStatus,
  type SessionOptions,
  type SessionConfirmPaymentParams,
  type SessionConfirmPaymentResult,
  type HyperSession,
  type UseHyperReturn,
  type UseWidgetsReturn,
  type ElementEventHandler,
  type PaymentButtonClickHandler,
  type HyperElementsProps,
  type ElementsProps,
  type HyperManagementElementsProps,
  type PaymentElementComponentProps,
  type PaymentMethodsManagementElementProps,
  type PaymentElementSessionProps,

  // Hooks
  useHyper,
  useStripe,
  useWidgets,
  useElements,
  useHyperSession,

  // Provider components
  HyperElements,
  Elements,
  HyperManagementElements,

  // Standard element components
  PaymentElement,
  CardElement,
  CardNumberElement,
  CardExpiryElement,
  CardCVCElement,
  GooglePayElement,
  ApplePayElement,
  PayPalElement,
  PazeElement,
  ExpressCheckoutElement,

  // Deprecated aliases
  UnifiedCheckout,
  CardWidget,
  CardNumberWidget,
  CardExpiryWidget,
  CardCVCWidget,

  // Management
  PaymentMethodsManagementElement,

  // Session
  PaymentElementSession,
} from "@juspay-tech/react-hyper-js";

// ---------------------------------------------------------------------------
// 2. Import shared types from @juspay-tech/hyper-js
// ---------------------------------------------------------------------------
import {
  type HyperInstance,
  type ElementsOptions,
  type Element,
  type EventData,
  type ConfirmPaymentResponse,
  type ConfirmPaymentErrorResponse,
  type RetrievePaymentIntentResponse,
  type ElementsAppearanceOptions,
  loadHyper,
} from "@juspay-tech/hyper-js";

// ---------------------------------------------------------------------------
// Helper: compile-time assertion that a value has an expected type
// ---------------------------------------------------------------------------
function expectType<T>(_value: T): void {}

// ---------------------------------------------------------------------------
// 3. SessionStatus type
// ---------------------------------------------------------------------------
{
  const loading: SessionStatus = "loading";
  const ready: SessionStatus = "ready";
  const error: SessionStatus = "error";
  expectType<SessionStatus>(loading);
  expectType<SessionStatus>(ready);
  expectType<SessionStatus>(error);
}

// ---------------------------------------------------------------------------
// 4. SessionOptions
// ---------------------------------------------------------------------------
{
  const opts: SessionOptions = {};
  const optsFull: SessionOptions = {
    appearance: { theme: "midnight" },
    layout: "tabs",
    fonts: [{ cssSrc: "https://fonts.googleapis.com/css2?family=Roboto" }],
    locale: "en",
    loader: "auto",
    clientSecret: "pi_xxx_secret_yyy",
  };
  expectType<SessionOptions>(opts);
  expectType<SessionOptions>(optsFull);
}

// ---------------------------------------------------------------------------
// 5. SessionConfirmPaymentParams / SessionConfirmPaymentResult
// ---------------------------------------------------------------------------
{
  const params: SessionConfirmPaymentParams = {
    confirmParams: { return_url: "https://example.com" },
    redirect: "if_required",
  };
  expectType<SessionConfirmPaymentParams>(params);

  const result: SessionConfirmPaymentResult = {
    error: undefined,
    status: "succeeded",
    paymentIntent: { id: "pi_123" },
  };
  expectType<SessionConfirmPaymentResult>(result);
}

// ---------------------------------------------------------------------------
// 6. HyperSession
// ---------------------------------------------------------------------------
{
  // We can only construct a HyperSession in tests by asserting — it's
  // returned by the useHyperSession hook at runtime.
  const session = {} as HyperSession;

  expectType<Element | null>(session.widgets);
  expectType<SessionStatus>(session.status);
  expectType<string | null>(session.error);

  // Methods
  const confirmPromise = session.confirmPayment({
    confirmParams: { return_url: "https://example.com" },
  });
  expectType<Promise<SessionConfirmPaymentResult>>(confirmPromise);

  const cardPromise = session.confirmCardPayment("cs_secret");
  expectType<Promise<any>>(cardPromise);

  const retrievePromise = session.retrievePaymentIntent("pi_123");
  expectType<Promise<any>>(retrievePromise);

  const pr = session.paymentRequest({ country: "US", currency: "usd" });
  expectType<any>(pr);

  const completePromise = session.completeUpdateIntent("cs_123");
  expectType<Promise<any>>(completePromise);

  const initiatePromise = session.initiateUpdateIntent();
  expectType<Promise<any>>(initiatePromise);

  const tokenPromise = session.confirmTokenization({ token: "tok_123" });
  expectType<Promise<any>>(tokenPromise);
}

// ---------------------------------------------------------------------------
// 7. UseHyperReturn
// ---------------------------------------------------------------------------
{
  const hyper = {} as UseHyperReturn;

  expectType<string>(hyper.clientSecret);

  const confirmPromise = hyper.confirmPayment({ elements: {} });
  expectType<Promise<any>>(confirmPromise);

  const cardPromise = hyper.confirmCardPayment("cs_secret", {}, {});
  expectType<Promise<any>>(cardPromise);

  const retrievePromise = hyper.retrievePaymentIntent("pi_123");
  expectType<Promise<any>>(retrievePromise);

  const pr = hyper.paymentRequest({ country: "US" });
  expectType<any>(pr);

  const completePromise = hyper.completeUpdateIntent("cs_123");
  expectType<Promise<any>>(completePromise);

  const initiatePromise = hyper.initiateUpdateIntent();
  expectType<Promise<any>>(initiatePromise);

  const tokenPromise = hyper.confirmTokenization({ token: "tok_123" });
  expectType<Promise<any>>(tokenPromise);
}

// ---------------------------------------------------------------------------
// 8. UseWidgetsReturn
// ---------------------------------------------------------------------------
{
  const widgets = {} as UseWidgetsReturn;

  expectType<Record<string, any>>(widgets.options);
  widgets.update({ locale: "fr" });
  const el = widgets.getElement("payment");
  expectType<any | null>(el);
  const updatesPromise = widgets.fetchUpdates();
  expectType<Promise<any>>(updatesPromise);
  const created = widgets.create("card", {});
  expectType<any>(created);
}

// ---------------------------------------------------------------------------
// 9. ElementEventHandler / PaymentButtonClickHandler
// ---------------------------------------------------------------------------
{
  const handler1: ElementEventHandler = (data) => {
    console.log(data);
  };
  const handler2: ElementEventHandler = undefined;
  expectType<ElementEventHandler>(handler1);
  expectType<ElementEventHandler>(handler2);

  const clickHandler1: PaymentButtonClickHandler = async () => {};
  const clickHandler2: PaymentButtonClickHandler = undefined;
  expectType<PaymentButtonClickHandler>(clickHandler1);
  expectType<PaymentButtonClickHandler>(clickHandler2);
}

// ---------------------------------------------------------------------------
// 10. Provider components — HyperElements
// ---------------------------------------------------------------------------
{
  const hyperPromise: Promise<HyperInstance> = loadHyper("pk_test_123");
  const options: ElementsOptions = { clientSecret: "pi_xxx_secret_yyy" };

  // HyperElements with `hyper` prop
  const hyperEl = React.createElement(HyperElements, {
    hyper: hyperPromise,
    options,
    children: React.createElement("div"),
  });
  expectType<React.ReactElement>(hyperEl);
}

// ---------------------------------------------------------------------------
// 11. Provider components — Elements (Stripe-compat)
// ---------------------------------------------------------------------------
{
  const hyperPromise: Promise<HyperInstance> = loadHyper("pk_test_123");
  const options: ElementsOptions = { clientSecret: "pi_xxx_secret_yyy" };

  const elementsEl = React.createElement(Elements, {
    stripe: hyperPromise,
    options,
    children: React.createElement("div"),
  });
  expectType<React.ReactElement>(elementsEl);
}

// ---------------------------------------------------------------------------
// 12. Provider components — HyperManagementElements
// ---------------------------------------------------------------------------
{
  const hyperPromise: Promise<HyperInstance> = loadHyper("pk_test_123");

  const mgmtEl = React.createElement(HyperManagementElements, {
    hyper: hyperPromise,
    options: { ephemeralKey: "ek_test_123" },
    children: React.createElement("div"),
  });
  expectType<React.ReactElement>(mgmtEl);
}

// ---------------------------------------------------------------------------
// 13. Standard element components — all with PaymentElementComponentProps
// ---------------------------------------------------------------------------
{
  const sharedProps: PaymentElementComponentProps = {
    id: "payment",
    options: { layout: "tabs" },
    onChange: (data) => console.log(data),
    onReady: () => {},
    onFocus: () => {},
    onBlur: () => {},
    onClick: () => {},
    onPaymentComplete: (data) => console.log(data),
    onPaymentButtonClick: async () => {},
  };

  // PaymentElement
  expectType<React.ReactElement>(
    React.createElement(PaymentElement, sharedProps)
  );

  // CardElement
  expectType<React.ReactElement>(React.createElement(CardElement, sharedProps));

  // CardNumberElement
  expectType<React.ReactElement>(
    React.createElement(CardNumberElement, sharedProps)
  );

  // CardExpiryElement
  expectType<React.ReactElement>(
    React.createElement(CardExpiryElement, sharedProps)
  );

  // CardCVCElement
  expectType<React.ReactElement>(
    React.createElement(CardCVCElement, sharedProps)
  );

  // GooglePayElement
  expectType<React.ReactElement>(
    React.createElement(GooglePayElement, sharedProps)
  );

  // ApplePayElement
  expectType<React.ReactElement>(
    React.createElement(ApplePayElement, sharedProps)
  );

  // PayPalElement
  expectType<React.ReactElement>(
    React.createElement(PayPalElement, sharedProps)
  );

  // PazeElement
  expectType<React.ReactElement>(React.createElement(PazeElement, sharedProps));

  // ExpressCheckoutElement
  expectType<React.ReactElement>(
    React.createElement(ExpressCheckoutElement, sharedProps)
  );
}

// ---------------------------------------------------------------------------
// 14. Deprecated aliases
// ---------------------------------------------------------------------------
{
  const props: PaymentElementComponentProps = {};

  expectType<React.ReactElement>(
    React.createElement(UnifiedCheckout, props)
  );
  expectType<React.ReactElement>(React.createElement(CardWidget, props));
  expectType<React.ReactElement>(
    React.createElement(CardNumberWidget, props)
  );
  expectType<React.ReactElement>(
    React.createElement(CardExpiryWidget, props)
  );
  expectType<React.ReactElement>(React.createElement(CardCVCWidget, props));
}

// ---------------------------------------------------------------------------
// 15. PaymentMethodsManagementElement
// ---------------------------------------------------------------------------
{
  const mgmtProps: PaymentMethodsManagementElementProps = {
    id: "payment-management",
    options: {},
    onChange: (data) => console.log(data),
    onReady: () => {},
    onFocus: () => {},
    onBlur: () => {},
    onClick: () => {},
    componentType: "paymentMethodsManagement",
  };

  expectType<React.ReactElement>(
    React.createElement(PaymentMethodsManagementElement, mgmtProps)
  );
}

// ---------------------------------------------------------------------------
// 16. PaymentElementSession
// ---------------------------------------------------------------------------
{
  const session = {} as HyperSession;

  const sessionProps: PaymentElementSessionProps = {
    session,
    options: { layout: "tabs" },
    onChange: (data: any) => console.log(data),
    onReady: () => {},
    onFocus: () => {},
    onBlur: () => {},
    onClick: () => {},
    onPaymentComplete: (data: any) => console.log(data),
    onPaymentButtonClick: async () => {},
    id: "payment-element",
  };

  expectType<React.ReactElement>(
    React.createElement(PaymentElementSession, sessionProps)
  );
}

// ---------------------------------------------------------------------------
// 17. useHyper() hook
// ---------------------------------------------------------------------------
{
  // Type-level test: useHyper returns UseHyperReturn
  expectType<() => UseHyperReturn>(useHyper);

  // Simulated usage
  const hyper: UseHyperReturn = {} as ReturnType<typeof useHyper>;

  expectType<string>(hyper.clientSecret);
  expectType<Promise<any>>(hyper.confirmPayment({}));
  expectType<Promise<any>>(hyper.confirmCardPayment("cs_secret"));
  expectType<Promise<any>>(hyper.retrievePaymentIntent("pi_123"));
  expectType<any>(hyper.paymentRequest({}));
  expectType<Promise<any>>(hyper.completeUpdateIntent("cs_123"));
  expectType<Promise<any>>(hyper.initiateUpdateIntent());
  expectType<Promise<any>>(hyper.confirmTokenization({}));
}

// ---------------------------------------------------------------------------
// 18. useStripe() deprecated alias
// ---------------------------------------------------------------------------
{
  expectType<() => UseHyperReturn>(useStripe);
}

// ---------------------------------------------------------------------------
// 19. useWidgets() hook
// ---------------------------------------------------------------------------
{
  expectType<() => UseWidgetsReturn>(useWidgets);

  const widgets: UseWidgetsReturn = {} as ReturnType<typeof useWidgets>;
  expectType<Record<string, any>>(widgets.options);
}

// ---------------------------------------------------------------------------
// 20. useElements() deprecated alias
// ---------------------------------------------------------------------------
{
  expectType<() => UseWidgetsReturn>(useElements);
}

// ---------------------------------------------------------------------------
// 21. useHyperSession() hook
// ---------------------------------------------------------------------------
{
  // Return type: HyperSession | null
  expectType<
    (
      sdkAuthorization?: string,
      options?: SessionOptions
    ) => HyperSession | null
  >(useHyperSession);

  // Simulated usage
  const session: HyperSession | null = {} as ReturnType<typeof useHyperSession>;

  if (session !== null) {
    expectType<SessionStatus>(session.status);
    expectType<Element | null>(session.widgets);
    expectType<string | null>(session.error);

    // All methods
    expectType<Promise<SessionConfirmPaymentResult>>(
      session.confirmPayment({
        confirmParams: { return_url: "https://example.com" },
      })
    );
    expectType<Promise<any>>(session.confirmCardPayment("cs_secret"));
    expectType<Promise<any>>(session.retrievePaymentIntent("pi_123"));
    expectType<any>(session.paymentRequest({}));
    expectType<Promise<any>>(session.completeUpdateIntent("cs_123"));
    expectType<Promise<any>>(session.initiateUpdateIntent());
    expectType<Promise<any>>(session.confirmTokenization({}));
  }
}

// ---------------------------------------------------------------------------
// 22. Cross-package type compatibility
// ---------------------------------------------------------------------------
{
  // HyperElementsProps.hyper accepts Promise<HyperInstance> from hyper-js
  const hyperPromise: Promise<HyperInstance> = loadHyper("pk_test_123");
  const props: HyperElementsProps = {
    hyper: hyperPromise,
    options: { clientSecret: "pi_xxx_secret_yyy" },
    children: null,
  };
  expectType<HyperElementsProps>(props);

  // ElementsOptions from hyper-js is accepted in provider options
  const elementsOpts: ElementsOptions = {
    clientSecret: "pi_xxx_secret_yyy",
    appearance: {
      theme: "midnight",
      variables: { colorPrimary: "#0570de" },
    },
    locale: "en",
    loader: "auto",
  };
  const props2: HyperElementsProps = {
    hyper: hyperPromise,
    options: elementsOpts,
    children: null,
  };
  expectType<HyperElementsProps>(props2);
}

// ---------------------------------------------------------------------------
// 23. Shared hyper-js types used in react-hyper-js context
// ---------------------------------------------------------------------------
{
  // EventData is used in element callbacks
  const eventData: EventData = {
    iframeMounted: true,
    focus: false,
    blur: false,
    ready: true,
    clickTriggered: false,
    completeDoThis: false,
    elementType: "card",
    classChange: false,
    newClassType: "",
    confirmTriggered: false,
    oneClickConfirmTriggered: false,
  };
  expectType<EventData>(eventData);

  // ConfirmPaymentResponse
  const confirmResp: ConfirmPaymentResponse = {
    payment_id: "pi_123",
    merchant_id: "m_123",
    status: "succeeded",
    amount: 1000,
    net_amount: 1000,
    amount_capturable: 0,
    currency: "USD",
    payment_method: "card",
    attempt_count: 1,
  };
  expectType<ConfirmPaymentResponse>(confirmResp);

  // ConfirmPaymentErrorResponse
  const errorResp: ConfirmPaymentErrorResponse = {
    submitSuccessful: false,
    error: {
      type: "validation_error",
      message: "Card number is invalid",
    },
  };
  expectType<ConfirmPaymentErrorResponse>(errorResp);

  // RetrievePaymentIntentResponse
  const retrieveResp: RetrievePaymentIntentResponse = {
    paymentIntent: confirmResp,
  };
  expectType<RetrievePaymentIntentResponse>(retrieveResp);

  // ElementsAppearanceOptions
  const appearance: ElementsAppearanceOptions = {
    theme: "midnight",
    variables: {
      colorPrimary: "#0570de",
      fontFamily: "Roboto, sans-serif",
    },
    rules: {
      ".Input": { borderColor: "#000" },
    },
    labels: "Floating",
  };
  expectType<ElementsAppearanceOptions>(appearance);
}

// ---------------------------------------------------------------------------
// 24. Components accept minimal props (all optional)
// ---------------------------------------------------------------------------
{
  // PaymentElement with no props
  React.createElement(PaymentElement, {});

  // CardElement with only id
  React.createElement(CardElement, { id: "card" });

  // PaymentMethodsManagementElement with no props
  React.createElement(PaymentMethodsManagementElement, {});

  // PaymentElementSession requires session (mandatory)
  const session = {} as HyperSession;
  React.createElement(PaymentElementSession, { session });
}
