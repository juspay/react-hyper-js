// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Context from "../Context.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as JsxRuntime from "react/jsx-runtime";

function PaymentElementsWrapper(props) {
  var onPaymentButtonClick = props.onPaymentButtonClick;
  var onPaymentComplete = props.onPaymentComplete;
  var onClick = props.onClick;
  var onBlur = props.onBlur;
  var onFocus = props.onFocus;
  var componentType = props.componentType;
  var onReady = props.onReady;
  var onChange = props.onChange;
  var options = props.options;
  var __id = props.id;
  var id = __id !== undefined ? __id : "payment-Element";
  var hyperSwitch = React.useContext(Context.switchContext);
  var elementsState = React.useContext(Context.elementsContext);
  var divRef = React.useRef(null);
  var paymentElement = elementsState.create(componentType, options);
  React.useEffect((function () {
          var paymentElement = elementsState.create(componentType, options);
          paymentElement.mount("#orca-elements-payment-element-" + id);
        }), [
        divRef,
        elementsState
      ]);
  React.useEffect((function () {
          paymentElement.on("ready", onReady);
          paymentElement.on("focus", onFocus);
          paymentElement.on("blur", onBlur);
          paymentElement.on("clickTriggered", onClick);
          paymentElement.on("change", onChange);
          paymentElement.on("completeDoThis", onPaymentComplete);
          paymentElement.onSDKHandleClick(onPaymentButtonClick);
        }), [
        elementsState,
        hyperSwitch
      ]);
  return JsxRuntime.jsx("div", {
              ref: Caml_option.some(divRef),
              id: "orca-elements-payment-element-" + id
            });
}

var make = PaymentElementsWrapper;

export {
  make ,
}
/* react Not a pure module */
