Pod::Spec.new do |s|
  s.name = "CompatibleLayoutAnchors"
  s.version = "0.1.2"
  s.summary = "CompatibleLayoutAnchors takes away the boiler plate code to check which layout guide to use since safe area was introduced in iOS 11."
  s.author = "Truffls GmbH"
  s.license = { :type => "MIT" }
  s.homepage = "https://github.com/truffls/compatible-layout-anchors-ios"
  s.platform = :ios
  s.source = { :git => "git@github.com:truffls/compatible-layout-anchors-ios.git", :tag => "0.1.2" }
  s.source_files = "Pod/**/*.swift"
  s.ios.deployment_target = "9.0"
  s.ios.frameworks = 'UIKit'
  s.requires_arc = true
end
