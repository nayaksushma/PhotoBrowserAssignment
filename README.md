# PhotoBrowser.

### Author
Sushma nayak

### Description
A native iOS iPhone only app for viewing photos downloaded over a static json url. Search by title functionality is also added.

## Dependencies

Alamofire
SDWebImage

## Tools

Xcode 11.1
CocoaPods

## Architecture

`MVVM` architecture pattern is used.

## Language

Swift

## Folder Structure 

- All  `Models` will have its own folder called `Models` eg -
- All  `ViewModels` will have its own folder called `ViewModel` 
- All  `ViewControllers` will have its own folder called `ViewController`
	

## Configuration
    
The iOS project has the following configuration:
    
- Targets
    - PhotoBrowser  - App production target.
    - PhotoBrowserTests - App unit testing target.


## Steps To Run
1. Navigate to the project directory and run `pod install`from terminal to install cocoapods. This will generate the `xcworkspace` file.
2. Open `PhotoBrowser.xcworkspace`.
3. Choose the desired destination and tap run button or Hit ⌘R
