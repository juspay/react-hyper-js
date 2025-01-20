/**
 * @package @juspay-tech/react-hyper-js
 * @description React components and hooks for integrating Hyper payment processing
 * @version 1.0.0
 */

declare module "@juspay-tech/react-hyper-js" {
  import { ReactNode } from "react";

  // Address and Shipping Information

  /**
   * Address information used for billing and shipping
   * @interface Address
   */
  export interface Address {
    /** City name */
    city?: string;
    /** Two-letter country code */
    country?: string;
    /** Street address */
    line1?: string;
    /** Apartment, suite, unit number */
    line2?: string;
    /** ZIP or postal code */
    postal_code?: string;
    /** State, province, or region */
    state?: string;
  }

  /**
   * Shipping details for payment processing
   * @interface Shipping
   * @example
   * const shipping: Shipping = {
   *   address: { city: "San Francisco", country: "US" },
   *   name: "John Doe",
   *   phone: "+1234567890"
   * };
   */
  export interface Shipping {
    /** Shipping address information */
    address: Address;
    /** Recipient's full name */
    name: string;
    /** Shipping carrier (e.g., "FedEx", "UPS") */
    carrier?: string;
    /** Contact phone number */
    phone?: string;
    /** Shipment tracking number */
    tracking_number?: string;
  }

  // Payment Method Options

  /**
   * Card-specific payment method options
   * @interface PaymentMethodOptionsCard
   * @example
   * const options: PaymentMethodOptionsCard = {
   *   cvc: <input type="text" />,
   *   network: "visa"
   * };
   */
  export interface PaymentMethodOptionsCard {
    /** CVC/CVV input element */
    cvc: ReactNode;
    /** Card network (e.g., "visa", "mastercard") */
    network: string;
  }

  // Elements Configuration Options

  /**
   * Configuration options for Elements component
   * @interface ElementsOptions
   * @example
   * const options: ElementsOptions = {
   *   clientSecret: "pi_123_secret_456",
   *   locale: "en",
   *   fonts: [{ fontFamily: "Arial", src: "url(/fonts/arial.ttf)" }],
   *   appearance: { theme: "dark", variables: { colorPrimary: "#0570de" } },
   *   loader: "auto"
   * };
   */
  export interface ElementsOptions {
    /** Custom fonts to be loaded */
    fonts: Array<Record<string, any>>;
    /** Locale for element rendering */
    locale: string;
    /** Client secret from payment intent */
    clientSecret: string;
    /** UI customization options */
    appearance: Record<string, any>;
    /** Loading behavior ("auto" | "eager" | "lazy") */
    loader: string;
  }

  /**
   * Configuration options for PaymentMethodsManagementElements
   * @interface PaymentMethodsManagementElementsOptions
   * @example
   * const options: PaymentMethodsManagementElementsOptions = {
   *   fonts: [{ fontFamily: "Roboto", src: "url(/fonts/roboto.ttf)" }],
   *   locale: "en",
   *   ephemeralKey: "epk_12345",
   *   appearance: { theme: "light", variables: { colorPrimary: "#0570de" } },
   *   loader: "lazy"
   * };
   */
  export interface PaymentMethodsManagementElementsOptions {
    /** Custom fonts to be loaded */
    fonts: Array<Record<string, any>>;
    /** Locale for element rendering */
    locale: string;
    /** Ephemeral key for customer session */
    ephemeralKey: string;
    /** UI customization options */
    appearance: Record<string, any>;
    /** Loading behavior */
    loader: string;
  }

  // Event Data

  /**
   * Event data for payment element callbacks
   * @interface EventData
   * @example
   * const eventData: EventData = {
   *   iframeMounted: true,
   *   focusTriggered: false,
   *   blurTriggered: false,
   *   clickTriggered: true,
   *   elementType: "CardElement",
   *   classChange: false,
   *   newClassType: "active"
   * };
   */
  export interface EventData {
    /** Whether the iframe has mounted */
    iframeMounted: boolean;
    /** Whether the element has received focus */
    focusTriggered: boolean;
    /** Whether the element has lost focus */
    blurTriggered: boolean;
    /** Whether the element was clicked */
    clickTriggered: boolean;
    /** Type of element that triggered the event */
    elementType: string;
    /** Whether element classes changed */
    classChange: boolean;
    /** New class type if changed */
    newClassType: string;
  }

  // Context Types

  /**
   * Context type for Hyper payment processing
   * @interface SwitchContextType
   * @example
   * const hyperContext = useHyper();
   * const result = await hyperContext.confirmPayment(elements);
   */
  export interface SwitchContextType {
    /** Client secret from payment intent */
    clientSecret: string;
    /** Confirm a payment */
    confirmPayment: (
      elements: Record<string, any>
    ) => Promise<Record<string, any>>;
    /** Confirm a card payment */
    confirmCardPayment: (
      clientSecretId: string,
      data?: Record<string, any>,
      options?: Record<string, any>
    ) => Promise<Record<string, any>>;
    /** Retrieve payment intent details */
    retrievePaymentIntent: (
      paymentIntentId: string
    ) => Promise<Record<string, any>>;
    /** Create a payment request */
    paymentRequest: (options: Record<string, any>) => Record<string, any>;
  }

  /**
   * Context type for payment methods management
   * @interface PaymentMethodsManagementSwitchContextType
   * @example
   * const managementContext = useWidgets();
   * const paymentReq = managementContext.paymentRequest({ amount: 1000 });
   */
  export interface PaymentMethodsManagementSwitchContextType {
    /** Ephemeral key for customer session */
    ephemeralKey: string;
    /** Create a payment request */
    paymentRequest: (options: Record<string, any>) => Record<string, any>;
  }

  // Base Elements Props

  /**
   * Base props for all payment elements
   */
  interface BaseElementProps {
    /** Unique identifier for the element */
    id?: string;
    /** Element-specific options */
    options?: Record<string, any>;
    /** Called when the element value changes */
    onChange?: (event: EventData) => void;
    /** Called when the element is ready */
    onReady?: (event: EventData) => void;
    /** Called when the element receives focus */
    onFocus?: (event: EventData) => void;
    /** Called when the element loses focus */
    onBlur?: (event: EventData) => void;
    /** Called when the element is clicked */
    onClick?: (event: EventData) => void;
    /** Called when payment is completed */
    onPaymentComplete?: (event: EventData) => void;
    /** Called when payment button is clicked */
    onPaymentButtonClick?: (event: EventData) => void;
  }

  // Context Hooks

  /**
   * Hook to access the Hyper payment context
   * @returns {SwitchContextType} Hyper payment context
   * @example
   * const hyper = useHyper();
   * await hyper.confirmPayment(elements);
   */
  export function useHyper(): SwitchContextType;

  /**
   * @deprecated Use useHyper() instead
   */
  export function useStripe(): SwitchContextType;

  /**
   * Hook to access Elements context
   * @returns {ElementsOptions} Elements context
   * @example
   * const widgets = useWidgets();
   * const { clientSecret, appearance } = widgets;
   */
  export function useWidgets(): ElementsOptions;

  /**
   * @deprecated Use useWidgets() instead
   */
  export function useElements(): ElementsOptions;

  // Components

  /**
   * Provider component for Hyper Elements
   * @example
   * <Elements options={{ clientSecret: 'pi_123' }}>
   *   <PaymentElement
   *     id="payment-element"
   *     options={{ style: { base: { fontSize: '16px' } } }}
   *     onChange={event => console.log('change', event)}
   *     onReady={event => console.log('ready', event)}
   *     onFocus={event => console.log('focus', event)}
   *     onBlur={event => console.log('blur', event)}
   *     onClick={event => console.log('click', event)}
   *     onPaymentComplete={event => console.log('payment complete', event)}
   *     onPaymentButtonClick={event => console.log('payment button clicked', event)}
   *   />
   * </Elements>
   */
  export const Elements: React.FC<{
    children: ReactNode;
    options: ElementsOptions;
  }>;

  /**
   * Alternative name for Elements component
   * @example
   * <HyperElements options={{ clientSecret: 'pi_123' }}>
   *   <PaymentElement
   *     id="payment-element"
   *     options={{ style: { base: { fontSize: '16px' } } }}
   *     onChange={event => console.log('change', event)}
   *     onReady={event => console.log('ready', event)}
   *     onFocus={event => console.log('focus', event)}
   *     onBlur={event => console.log('blur', event)}
   *     onClick={event => console.log('click', event)}
   *     onPaymentComplete={event => console.log('payment complete', event)}
   *     onPaymentButtonClick={event => console.log('payment button clicked', event)}
   *   />
   * </HyperElements>
   */
  export const HyperElements: React.FC<{
    children: ReactNode;
    options: ElementsOptions;
  }>;

  /**
   * Complete payment form element
   * @example
   * <PaymentElement
   *   id="payment-element"
   *   options={{ style: { base: { fontSize: '16px' } } }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const PaymentElement: React.FC<BaseElementProps>;

  /**
   * Unified checkout component
   * @example
   * <UnifiedCheckout
   *   id="unified-checkout"
   *   options={{ style: { base: { fontSize: '16px' } } }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const UnifiedCheckout: React.FC<BaseElementProps>;

  // Card Elements

  /**
   * Complete card input element
   * @example
   * <CardElement
   *   id="card-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardElement: React.FC<BaseElementProps>;

  /**
   * Card widget component
   * @example
   * <CardWidget
   *   id="card-widget"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardWidget: React.FC<BaseElementProps>;

  /**
   * Card number input element
   * @example
   * <CardNumberElement
   *   id="card-number-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardNumberElement: React.FC<BaseElementProps>;

  /**
   * Card number widget
   * @example
   * <CardNumberWidget
   *   id="card-number-widget"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardNumberWidget: React.FC<BaseElementProps>;

  /**
   * Card CVC input element
   * @example
   * <CardCVCElement
   *   id="card-cvc-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardCVCElement: React.FC<BaseElementProps>;

  /**
   * Card CVC widget
   * @example
   * <CardCVCWidget
   *   id="card-cvc-widget"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardCVCWidget: React.FC<BaseElementProps>;

  /**
   * Card expiry input element
   * @example
   * <CardExpiryElement
   *   id="card-expiry-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardExpiryElement: React.FC<BaseElementProps>;

  /**
   * Card expiry widget
   * @example
   * <CardExpiryWidget
   *   id="card-expiry-widget"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const CardExpiryWidget: React.FC<BaseElementProps>;

  // Digital Wallet Elements

  /**
   * Google Pay payment element
   * @example
   * <GooglePayElement
   *   id="google-pay-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const GooglePayElement: React.FC<BaseElementProps>;

  /**
   * Apple Pay payment element
   * @example
   * <ApplePayElement
   *   id="apple-pay-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const ApplePayElement: React.FC<BaseElementProps>;

  /**
   * PayPal payment element
   * @example
   * <PayPalElement
   *   id="paypal-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const PayPalElement: React.FC<BaseElementProps>;

  /**
   * Paze payment element
   * @example
   * <PazeElement
   *   id="paze-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const PazeElement: React.FC<BaseElementProps>;

  // Other Elements

  /**
   * Express checkout element for multiple payment methods
   * @example
   * <ExpressCheckoutElement
   *   id="express-checkout-element"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const ExpressCheckoutElement: React.FC<BaseElementProps>;

  /**
   * Management interface for Hyper elements
   * @example
   * <HyperManagementElements
   *   id="hyper-management-elements"
   *   options={{
   *     style: { base: { fontSize: '16px', color: '#424770' } },
   *     ephemeralKey: 'key_1234',
   *   }}
   *   hyper={promiseOfSwitchInstance}
   * >
   *    {children}
   * </HyperManagementElements>
   */
  export const HyperManagementElements: React.FC<BaseElementProps>;

  /**
   * Management interface for payment methods
   * @example
   * <PaymentMethodsManagementElement
   *   id="payment-management"
   *   options={{
   *     style: {
   *       base: { fontSize: '16px', color: '#424770' }
   *     }
   *   }}
   *   onChange={event => console.log('change', event)}
   *   onReady={event => console.log('ready', event)}
   *   onFocus={event => console.log('focus', event)}
   *   onBlur={event => console.log('blur', event)}
   *   onClick={event => console.log('click', event)}
   *   onPaymentComplete={event => console.log('payment complete', event)}
   *   onPaymentButtonClick={event => console.log('payment button clicked', event)}
   * />
   */
  export const PaymentMethodsManagementElement: React.FC<BaseElementProps>;
}
