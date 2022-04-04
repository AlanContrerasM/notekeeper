//  Login Exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//  register exceptions
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//  generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}


//original was like this inside login or register after the try block
// on FirebaseAuthException catch (e) {
  // devtools.log(e.code);
  // if (e.code == 'user-not-found') {
    // await showErrorDialog(
      // context,
      // "User not found",
    // );
  // } else if (e.code == 'wrong-passcode') {
    // await showErrorDialog(
      // context,
      // "Wrong credentials",
    // );
  // } else {
    // await showErrorDialog(
      // context,
      // 'Error: ${e.code}',
    // );
  // }
// } catch (e) {
  // this is how you learn what type of error you are getting
  // devtools.log(e.runtimeType
      // .toString()); //do print if not properly shown with log
  // await showErrorDialog(
    // context,
    // e.toString(),
  // );
// }