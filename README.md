# Adori-iOS-SDK-Sample-App
Sample app demonstrating Adori iOS SDK 

This repository contains sample app for the Adori SDK for iOS. These demonstrate how the iOS SDK can be installed using CocoaPods, integrate into your own app and to run interactive podcasts.

## CocoaPods
It's easy to install the Adori iOS framework if you manage your dependencies using CocoaPods. Simply add the following to your Podfile:

~~~.rb
source 'https://github.com/Adori/cocoapod-specs.git'

target 'Adori Sample App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'AdoriiOSSDK', '~> 2.0.0'
end
~~~

Then run `pod install --verbose` to install the dependencies to your project.


