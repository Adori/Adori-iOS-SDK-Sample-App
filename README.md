# Adori-iOS-SDK-Sample-App
Sample app demonstrating Adori iOS SDK 

This repository contains sample app for the Adori SDK for iOS. These demonstrate how the iOS SDK can be installed using CocoaPods, integrate into your own app and to run interactive podcasts.

## Run the sample app
To run the sample app, simply go to the project folder and run `pod install`. Open the project, build and run the application.

## Updates

2.1.27 Update : This update brings the ability to do play listing. You will need to reset the Player speed to 1.0 at the end of each item in the queue player. This can be achieved by observing the player as shown in the sample app. Check for `canChangeSpeed` to be enabled right after we get the new AdoriID to reset the player speed to normal.


