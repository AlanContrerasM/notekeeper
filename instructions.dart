// flutter create appname
// *If you have a domain or org, and you want to release it later
// flutter create --org com.domain appname
// add dependencies, one option is to use firebase
// you can see packages, libraries, etc on pub.dev
// add them with flutter pub add firebase_core
// dependencies to add:
// *firebase_core
// *firebase_auth
// *cloud_firestore
// *firebase_analytics

//if downloading or cloning.
// after cloning
//flutter pub get
// ----  Setting IOS App ----
// *Preparing for releasing later
// You need an IOS developper account, you need to apply and pay money
// When we publish we need to sign our application with our certificate given by apple
// Profile, identifies you, certificate identifies your app, we also have app ids for notification
// You create these things on the web page for apple developers, and you also save them on your macs
// Honestly Too many instructions and the steps to add it are very complicated
// if you ever wanna publish, follow instructions on video "Flutter Course for Beginners - 37hour ..." youtube video
// hour 6 ish of the video
// after adding the stuff to xcode and setting up permissions, etc. 
// if you get an error about min version, you fix than on podfile, uncomment line and specify min version.
// flutter clean ios
// flutter pub get

//if it ever asks for bundle id, do com.domain.appname


// ---- Android Development ----
// you will get an error for minSDK version, set at least 21, you get less errors
//also error for multidex, on android/app/ graddle, set the minSDK version, and also set the Multidex, 
//and add implementation to the bottom


//firebase
// # Install the CLI if not already done so, this is done once per machine
// curl -sL https://firebase.tools | bash
//or
//npm install -g firebase-tools

//For backend we are gonna use Firebase, and FlutterFire.
// dart pub global activate flutterfire_cli
//*Make sure to follow instructions on the terminal to update path, this is done once. per computer

//Run
//firebase login

// # Run the `configure` command, select a Firebase project and platforms
// flutterfire configure
//create a new project, and use an original id
//if getting an error, create the project on console firebase, and then run the flutterfire configure


//Actually Work on Dart.

// if using firebase do the imports on top of the page, and follow some instructions written on
// firebase_options.dart
//on your project in firebase console, webpage, turn on authentication, and enable email and password combination

//Enable email verification

//code like crazy, you can set up basic email auth very simple, or extract your logic to a service
//so more logic and extra services like Firebase are outside your UI layer

//You can also set up tests, if you want to be more professional.
// Unit Tests, ugh... on test folders, There could be unit tests, widget, integration tests
//flutter pub add test --dev
//to test them
//fluter test test/auth_test.dart
//test1