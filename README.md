![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/logo.png "Compatible Layout Anchors")

![Swift Version](https://img.shields.io/badge/swift-4.1-orange.svg "Swift 4.1")
![Platform Compatibility](https://img.shields.io/badge/platform-ios-lightgrey.svg "Platform iOS")
![Pod version](https://img.shields.io/badge/pod-v2.0.0-blue.svg "Pod version 2.0.0")

An easy way to support iOS 11 safe area anchors and iOS <=10 top/bottom layout guides at the same time. CompatibleLayoutAnchors takes away the boiler plate code to check which layout anchors to use.


### Problem

If you're using iOS 11's safe area and NIBs for your interfaces the fallback constraints for iOS <=10 falls back to the superview's anchors instead of top/bottom layout guides.

In a usual workflow you would setup your nib and looking OK in Interface Builder.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/setup-nib.png "Setup NIB")

But in iOS <=10 it looks broken.

| Actual | Expected |
| ------ | -------- |
| ![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/before.gif "Broken layout constraints") | ![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/after.jpg "Fixed layout constraints") |


### Install via Cocoapods

Add following to your `Podfile`:

```ruby
use_frameworks!
pod 'CompatibleLayoutAnchors'
```

### How to use

You have your layout in a NIB file ready with all layout constraints. Reference in your view controller the top constraints connected to the safe area top anchor and the bottom constraints connected to the safe area bottom anchor. Use `assignCompatibleConstraint(_:for:)` to reassign the top and bottom constraints with the appropriate constraints.

```swift
assignCompatibleConstraint(&myTopConstraint, for: .top)
```

### Example

This code fits to the screenshots above.

```swift
class ViewController: UIViewController {

    @IBOutlet weak var headlineLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var footnoteLabelBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        assignCompatibleConstraint(&headlineLabelTopConstraint, for: .top)
        assignCompatibleConstraint(&footnoteLabelBottomConstraint, for: .bottom)
    }
}
```

### Contribution

Issues and pull requests are welcome!
