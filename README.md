# PageImageScrollView


[![Version](https://img.shields.io/cocoapods/v/PageImageScrollView.svg?style=flat)](https://cocoapods.org/pods/PageImageScrollView)
[![License](https://img.shields.io/cocoapods/l/PageImageScrollView.svg?style=flat)](https://cocoapods.org/pods/PageImageScrollView)
[![Platform](https://img.shields.io/cocoapods/p/PageImageScrollView.svg?style=flat)](https://cocoapods.org/pods/PageImageScrollView)

## Requirements
- iOS 9.0 or higher
- Swift 5.0

## Usage
### import
```swift
import PageImageScrollView
```

## Use
### Storyboard
Add a custom view to the storyboard and set its class to "PageImageScrollView"

### Programmatically
```swift
let pageScrollView = PageImageScrollView()
view.addSubView(pageScrollView)
```

### Example
```swift
pageScroll.pageIndicatorTintColor = UIColor.systemBlue
pageScrollView.currentPageIndicatorTintColor = UIColor.black
pageScrollView.images= [
    .init(systemName: "1.circle") ?? .init(),
    .init(systemName: "2.circle") ?? .init(),
    .init(systemName: "3.circle") ?? .init()
]
```


<img src = "https://user-images.githubusercontent.com/68891494/163092458-33899ca6-5040-41cf-b705-2334e78b4d69.gif" width = 200>


## Cocoapods

PageImageScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PageImageScrollView'
```
## Author
JiHoonAHN, ahnjh1028@naver.com


## License

PageImageScrollView is available under the MIT license. See the LICENSE file for more info.
