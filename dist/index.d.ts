// TypeScript declarations for @juspay-tech/react-hyper-js
// Auto-generated from ReScript source files — do not edit manually.

import type { ReactNode, ComponentType as ReactComponentType } from "react";
import type {
  HyperInstance,
  ElementsOptions,
  Element,
  EventData,
  ConfirmPaymentResponse,
  ConfirmPaymentErrorResponse,
  RetrievePaymentIntentResponse,
  ElementsAppearanceOptions,
} from "@juspay-tech/hyper-js";

// ---------------------------------------------------------------------------
// Session types (from src/types/HyperSession.res)
// ---------------------------------------------------------------------------

/** Status of a HyperSession lifecycle */
export type SessionStatus = "loading" | "ready" | "error";

/** Options for creating a HyperSession */
export interface SessionOptions {
  appearance?: Record<string, any>;
  layout?: any;
  fonts?: any[];
  locale?: string;
  loader?: string;
  clientSecret?: string;
}

/** Parameters passed to confirmPayment via HyperSession */
export interface SessionConfirmPaymentParams {
  confirmParams: Record<string, any>;
  redirect?: string;
}

/** Result returned by HyperSession.confirmPayment */
export interface SessionConfirmPaymentResult {
  error?: any;
  status?: string;
  paymentIntent?: any;
}

/**
 * The HyperSession object returned by `useHyperSession`.
 *
 * Provides a self-contained session that holds its own widgets instance
 * and SDK methods, without requiring a `<HyperElements>` provider.
 */
export interface HyperSession {
  /** The widgets instance (available when status is "ready") */
  widgets: Element | null;
  /** Current session status */
  status: SessionStatus;
  /** Error message if status is "error" */
  error: string | null;
  /** Confirm the payment using the session's internal widgets */
  confirmPayment(
    params: SessionConfirmPaymentParams
  ): Promise<SessionConfirmPaymentResult>;
  /** Confirm a card payment by client secret */
  confirmCardPayment(
    clientSecret: string,
    data?: any,
    options?: any
  ): Promise<any>;
  /** Retrieve a payment intent by its ID */
  retrievePaymentIntent(paymentIntentId: string): Promise<any>;
  /** Create a payment request object */
  paymentRequest(options: any): any;
  /** Complete an update intent flow */
  completeUpdateIntent(clientSecret: string): Promise<any>;
  /** Initiate an update intent flow */
  initiateUpdateIntent(): Promise<any>;
  /** Confirm tokenization */
  confirmTokenization(params: any): Promise<any>;
}

// ---------------------------------------------------------------------------
// Context types (from src/Context.res)
// ---------------------------------------------------------------------------

/**
 * Return type of `useHyper()` — the switch context.
 *
 * Provides SDK payment methods scoped to the current `<HyperElements>` provider.
 */
export interface UseHyperReturn {
  /** The client secret for the current payment intent */
  clientSecret: string;
  /** Confirm the payment */
  confirmPayment(params: any): Promise<any>;
  /** Confirm a card payment by client secret */
  confirmCardPayment(
    clientSecret: string,
    data?: any,
    options?: any
  ): Promise<any>;
  /** Retrieve a payment intent by its ID */
  retrievePaymentIntent(paymentIntentId: string): Promise<any>;
  /** Create a payment request object */
  paymentRequest(options: any): any;
  /** Complete an update intent flow */
  completeUpdateIntent(clientSecret: string): Promise<any>;
  /** Initiate an update intent flow */
  initiateUpdateIntent(): Promise<any>;
  /** Confirm tokenization */
  confirmTokenization(params: any): Promise<any>;
}

/**
 * Return type of `useWidgets()` — the elements context.
 *
 * Provides access to the current elements options.
 */
export interface UseWidgetsReturn {
  options: Record<string, any>;
  update(options: any): void;
  getElement(componentName: string): any | null;
  fetchUpdates(): Promise<any>;
  create(componentType: string, options: any): any;
}

// ---------------------------------------------------------------------------
// Hooks
// ---------------------------------------------------------------------------

/**
 * Returns the Hyper SDK context (switch context).
 *
 * Must be called inside a `<HyperElements>` or `<Elements>` provider.
 *
 * @example
 * ```tsx
 * const hyper = useHyper();
 * const result = await hyper.confirmPayment({ elements, confirmParams: { return_url } });
 * ```
 */
export function useHyper(): UseHyperReturn;

/**
 * @deprecated Use `useHyper()` instead.
 */
export function useStripe(): UseHyperReturn;

/**
 * Returns the widgets (elements) context.
 *
 * Must be called inside a `<HyperElements>` or `<Elements>` provider.
 *
 * @example
 * ```tsx
 * const widgets = useWidgets();
 * ```
 */
export function useWidgets(): UseWidgetsReturn;

/**
 * @deprecated Use `useWidgets()` instead.
 */
export function useElements(): UseWidgetsReturn;

/**
 * Standalone session hook — creates a HyperSession without a provider.
 *
 * Reads `window.__HYPER_SDK_INSTANCE__` to obtain the SDK instance.
 *
 * @param sdkAuthorization - The client secret / payment authorization token.
 * @param options - Optional session configuration.
 * @returns A `HyperSession` object when authorization is provided, or `null`.
 *
 * @example
 * ```tsx
 * const session = useHyperSession(clientSecret, { appearance });
 * if (session?.status === "ready") {
 *   const result = await session.confirmPayment({ confirmParams: { return_url } });
 * }
 * ```
 */
export function useHyperSession(
  sdkAuthorization?: string,
  options?: SessionOptions
): HyperSession | null;

// ---------------------------------------------------------------------------
// Common element callback types
// ---------------------------------------------------------------------------

/** Callback invoked when an element event fires with optional JSON data */
export type ElementEventHandler = ((data?: any) => void) | undefined;

/** Callback invoked when the SDK pay button is clicked (return a Promise) */
export type PaymentButtonClickHandler =
  | (() => Promise<void>)
  | undefined;

// ---------------------------------------------------------------------------
// Provider component props
// ---------------------------------------------------------------------------

/** Props for the `<HyperElements>` provider */
export interface HyperElementsProps {
  /** A Promise resolving to a HyperInstance (from `loadHyper()`) */
  hyper: Promise<HyperInstance>;
  /** Elements options including clientSecret, appearance, locale, etc. */
  options: ElementsOptions | Record<string, any>;
  children: ReactNode;
}

/**
 * Props for the `<Elements>` provider (Stripe-compatible naming).
 *
 * Identical to `HyperElementsProps` except the instance prop is named `stripe`.
 */
export interface ElementsProps {
  /** A Promise resolving to a HyperInstance (Stripe-compat prop name) */
  stripe: Promise<HyperInstance>;
  /** Elements options including clientSecret, appearance, locale, etc. */
  options: ElementsOptions | Record<string, any>;
  children: ReactNode;
}

/** Props for the `<HyperManagementElements>` provider */
export interface HyperManagementElementsProps {
  /** A Promise resolving to a HyperInstance (from `loadHyper()`) */
  hyper: Promise<HyperInstance>;
  /** Management elements options (ephemeralKey, appearance, etc.) */
  options: Record<string, any>;
  children: ReactNode;
}

// ---------------------------------------------------------------------------
// Standard element component props
// ---------------------------------------------------------------------------

/**
 * Common props shared by all standard payment element components.
 *
 * All props are optional — the component will render with defaults.
 */
export interface PaymentElementComponentProps {
  /** A unique identifier for the element container */
  id?: string;
  /** Element-specific configuration options */
  options?: Record<string, any>;
  /** Fires when the element value changes */
  onChange?: ElementEventHandler;
  /** Fires when the element is ready */
  onReady?: ElementEventHandler;
  /** Fires when the element gains focus */
  onFocus?: ElementEventHandler;
  /** Fires when the element loses focus */
  onBlur?: ElementEventHandler;
  /** Fires when the element is clicked */
  onClick?: ElementEventHandler;
  /** Fires when payment completes */
  onPaymentComplete?: ElementEventHandler;
  /** Intercept SDK pay button click for custom validation before confirm */
  onPaymentButtonClick?: PaymentButtonClickHandler;
}

// ---------------------------------------------------------------------------
// Payment Methods Management element props
// ---------------------------------------------------------------------------

/** Props for the `<PaymentMethodsManagementElement>` component */
export interface PaymentMethodsManagementElementProps {
  /** A unique identifier for the element container (default: "payment-management") */
  id?: string;
  /** Element-specific configuration options */
  options?: Record<string, any>;
  /** Fires when the element value changes */
  onChange?: ElementEventHandler;
  /** Fires when the element is ready */
  onReady?: ElementEventHandler;
  /** Fires when the element gains focus */
  onFocus?: ElementEventHandler;
  /** Fires when the element loses focus */
  onBlur?: ElementEventHandler;
  /** Fires when the element is clicked */
  onClick?: ElementEventHandler;
  /** The component type (default: "paymentMethodsManagement") */
  componentType?: string;
}

// ---------------------------------------------------------------------------
// PaymentElementSession props
// ---------------------------------------------------------------------------

/** Props for the `<PaymentElementSession>` component */
export interface PaymentElementSessionProps {
  /** A HyperSession object (from `useHyperSession`) */
  session: HyperSession;
  /** Element-specific configuration options */
  options?: Record<string, any>;
  /** Fires when the element value changes */
  onChange?: (data: any) => void;
  /** Fires when the element is ready */
  onReady?: () => void;
  /** Fires when the element gains focus */
  onFocus?: () => void;
  /** Fires when the element loses focus */
  onBlur?: () => void;
  /** Fires when the element is clicked */
  onClick?: () => void;
  /** Fires when payment completes */
  onPaymentComplete?: (data: any) => void;
  /** Intercept SDK pay button click */
  onPaymentButtonClick?: () => Promise<void>;
  /** A unique identifier for the element container (default: "payment-element") */
  id?: string;
}

// ---------------------------------------------------------------------------
// Provider components
// ---------------------------------------------------------------------------

/**
 * Provider that initializes the Hyper SDK context.
 *
 * Wrap your checkout form with this component to give child elements and
 * hooks access to the SDK instance.
 *
 * @example
 * ```tsx
 * <HyperElements hyper={hyperPromise} options={{ clientSecret }}>
 *   <CheckoutForm />
 * </HyperElements>
 * ```
 */
export const HyperElements: ReactComponentType<HyperElementsProps>;

/**
 * Stripe-compatible alias for `<HyperElements>`.
 *
 * Uses `stripe` prop instead of `hyper` for drop-in migration.
 */
export const Elements: ReactComponentType<ElementsProps>;

/**
 * Provider for payment methods management flows.
 *
 * Used with `<PaymentMethodsManagementElement>` for saved payment method management.
 */
export const HyperManagementElements: ReactComponentType<HyperManagementElementsProps>;

// ---------------------------------------------------------------------------
// Standard element components
// ---------------------------------------------------------------------------

/**
 * Renders the unified payment form (all payment methods).
 *
 * @example
 * ```tsx
 * <PaymentElement
 *   id="payment"
 *   options={{ layout: "tabs" }}
 *   onChange={(event) => console.log(event)}
 * />
 * ```
 */
export const PaymentElement: ReactComponentType<PaymentElementComponentProps>;

/** Alias for `<PaymentElement>` */
export const UnifiedCheckout: ReactComponentType<PaymentElementComponentProps>;

/** Renders a combined card input (number + expiry + CVC) */
export const CardElement: ReactComponentType<PaymentElementComponentProps>;

/** Alias for `<CardElement>` */
export const CardWidget: ReactComponentType<PaymentElementComponentProps>;

/** Renders a standalone card number input */
export const CardNumberElement: ReactComponentType<PaymentElementComponentProps>;

/** Alias for `<CardNumberElement>` */
export const CardNumberWidget: ReactComponentType<PaymentElementComponentProps>;

/** Renders a standalone card expiry input */
export const CardExpiryElement: ReactComponentType<PaymentElementComponentProps>;

/** Alias for `<CardExpiryElement>` */
export const CardExpiryWidget: ReactComponentType<PaymentElementComponentProps>;

/** Renders a standalone card CVC input */
export const CardCVCElement: ReactComponentType<PaymentElementComponentProps>;

/** Alias for `<CardCVCElement>` */
export const CardCVCWidget: ReactComponentType<PaymentElementComponentProps>;

/** Renders a Google Pay button */
export const GooglePayElement: ReactComponentType<PaymentElementComponentProps>;

/** Renders an Apple Pay button */
export const ApplePayElement: ReactComponentType<PaymentElementComponentProps>;

/** Renders a PayPal button */
export const PayPalElement: ReactComponentType<PaymentElementComponentProps>;

/** Renders a Paze button */
export const PazeElement: ReactComponentType<PaymentElementComponentProps>;

/** Renders an express checkout strip (GPay + Apple Pay + PayPal etc.) */
export const ExpressCheckoutElement: ReactComponentType<PaymentElementComponentProps>;

// ---------------------------------------------------------------------------
// Management components
// ---------------------------------------------------------------------------

/**
 * Renders the saved payment methods management UI.
 *
 * Must be wrapped in `<HyperManagementElements>`.
 */
export const PaymentMethodsManagementElement: ReactComponentType<PaymentMethodsManagementElementProps>;

// ---------------------------------------------------------------------------
// Session components
// ---------------------------------------------------------------------------

/**
 * Renders a payment element using a `HyperSession` instead of a provider.
 *
 * @example
 * ```tsx
 * const session = useHyperSession(clientSecret);
 * if (session) {
 *   return <PaymentElementSession session={session} />;
 * }
 * ```
 */
export const PaymentElementSession: ReactComponentType<PaymentElementSessionProps>;
