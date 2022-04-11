import 'package:flutter/material.dart' show BuildContext, ModalRoute;

//this is so we can get arguments that were passed through the navigator
//specifically in use for the createupdate function on this case
extension GetArgument on BuildContext {
  T? getArgument<T>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final args = modalRoute.settings.arguments;
      if (args != null && args is T) {
        return args as T;
      }
    }
    return null;
  }
}
