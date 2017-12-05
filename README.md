# CompatibleLayoutAnchors
An easy way to support iOS 11 safe area anchors old top/bottom layout guides. CompatibleLayoutAnchors takes away the boiler plate code to check which layout anchors to use.


### Problem

If you're using iOS 11 safe area layout guide and NIBs for your interfaces the fallback constraints for iOS 10 and older falls back to the super views anchors instead of the top/bottom layout guides.

You setup your nib and it looks OK in Interface builder.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/setup-nib.png "Setup NIB")

But in iOS versions lower that 11 it looks broken.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/before.gif "Broken layout constraints")

It should actually look like this.

![alt text](https://github.com/truffls/compatible-layout-anchors-ios/raw/master/readme-images/after.jpg "Fixed layout constraints")


### Install via Cocoapods

`pod 'CompatibleLayoutAnchors', :tag => '0.1.3', :git => 'ssh://git@github.com/truffls/compatible-layout-anchors-ios.git'`


### How to use

You have your layout in a NIB file ready with all layout constraints. Reference in view controller the top constraints connected to the safe area top anchor and the bottom constraints connected to the safe area bottom anchor. Use to `applyTopConstraint(_:)` and `applyBottomConstraint(_:)` to overwrite the top and the bottom constraints.

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

### Contributions

Contributions are welcome!
