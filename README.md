# Fidelity Screener with iOS WKWebView wrapper

Used to test web application to native mobile app event communication and integration issues.

## Example
JavaScript code from the screener web application that dispatches events to the mobile interface:

```javascript
var data = {
	"type": "APP_EVENT",
	"symbol": "INFO",
	"securityType": "COMMON_STOCK"
}
webkit.messageHandlers.fidCallbackHandler.postMessage(data);
```

## Dev Tools
- Xcode 8.1
- Swift 3.0

## Build Config
- Deployment Target iOS 9.0
