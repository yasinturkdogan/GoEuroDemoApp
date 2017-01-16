# GoEuroDemoApp

This is a demo Application developer for GoEuro. 

Check details from [here](https://github.com/goeuro/iOS-test)

Features : 

* Caching
* Sorting
* Using Autolayout
* Using CocoaPods
* Using Objective-C Bridging : CommonCrypto/CommonCrypto.h

## Caching

Caching is handled transparently by archiving object with NSKeyedArchiver as they load. Load operations completes with cached data first, then new data starts to load. 

## 3rd Party Libraries

### YTKeychainManager (My Own Library)

YTKeychainManager helps you to store data in KeyChain. Data stored in keychain remain even app is removed. If iCloud Keychain is enabled, it is also shared accross devices. Using user defaults as fallback.


[https://cocoapods.org/pods/YTKeychainManager](https://cocoapods.org/pods/YTKeychainManager)

### SwiftHTTP
SwiftHTTP is a thin wrapper around NSURLSession in Swift to simplify HTTP requests.

[https://cocoapods.org/pods/SwiftHTTP](https://cocoapods.org/pods/SwiftHTTP)

### SwiftyJSON
SwiftyJSON makes it easy to deal with JSON data in Swift.

[https://cocoapods.org/pods/SwiftyJSON](https://cocoapods.org/pods/SwiftyJSON)


### PinRemoteImage

PINRemoteImageManager is an image downloading, processing and caching manager.

[https://cocoapods.org/pods/PINRemoteImage](https://cocoapods.org/pods/PINRemoteImage)


