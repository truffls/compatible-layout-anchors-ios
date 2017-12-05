# CompatibleLayoutAnchors
An easy way to support iOS 11 safe area anchors old top/bottom layout guides. CompatibleLayoutAnchors takes away the boiler plate code to check which layout anchors to use.


### Problem

If you're using iOS 11 safe area layout guide and NIBs for your interfaces the fallback constraints for iOS 10 and older falls back to the super views anchors instead of the top/bottom layout guides.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/before.gif "Broken layout constraints")

But it should actually look like this.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/before.gif "Broken layout constraints")


### Install via Cocoapods

`pod 'CompatibleLayoutAnchors', :tag => '0.1.0', :git => 'ssh://git@github.com/truffls/compatible-layout-anchors-ios.git'`


### How to use

You have your layout ready in a NIB file ready with all layout constraints. Connect your view controller with the top constraints connected to the safe area top and the bottom constraints connected to the safe area bottom.

You need to overwrite the top and the bottom constraints by using the `applyTopConstraint(_:)` and `applyBottomConstraint(_:)` functions.

    class ViewController: UIViewController {

        @IBOutlet weak var headlineLabelTopConstraint: NSLayoutConstraint!
        @IBOutlet weak var footnoteLabelBottomConstraint: NSLayoutConstraint!

        override func viewDidLoad() {
            super.viewDidLoad()

            headlineLabelTopConstraint = applyTopConstraint(headlineLabelTopConstraint)
            footnoteLabelBottomConstraint = applyBottomConstraint(footnoteLabelBottomConstraint)
        }
    }

Thats it.
