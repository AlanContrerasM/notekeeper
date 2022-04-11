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

//SQLite 
//we'll download DB browser for SQLite 
//snap install sqlitebrowser
//open the db browser
//new-database, call it testing or whatever
//start adding fields, 
//id, integer, not null, primary key, autoincrement
//email, text, nn, u
//then lets create a table for notes, id, user_id which has a foreign key id from users
//has text, and an optional is_synced_with_cloud that has a default value int 0, which means false.

//to copy these tables or create this in our app, we need a few dependencies
//fluter pub add and do all three sqflite, path_provider, path

//create a new file in services, crud/notes_service.dart
//for coding the app and sql code, you can copy the commands from db browser, select the table and right click, modify to see code
//code the service for notes, notes_service.dart

//now we can create a stream, this stream will be like the controller or manager 
//update our functions to also update cache when changing the notes database
//create right there on our notesService, which is our service for sqlite at this point access for users.
//Now lets prepare our notes views


//for firebase firestore integration... go to your console in firebase
//enter your project, and on the side menu select firestore Database
//create database, you can choose the test mode option for now, location should be us-central
//unless you are somewhere else
//after creating you can go to the rules tab, and change the permissions, effectively
//turning it kind of into production, 
//change the line of: request.time < timestamp.date(2022, 5, 10);
//with: request.auth != null;
//on the data tab, you can start a collection, write "notes" as id
//now you can start your first document, its schema, for this project add 
// "text" field, of type string, and "user_id" of type string. press autogenerate on documentId
//you can go ahead and delete that document right away
//you can now code your cloud service, after coding it comment out your notes_service