import 'package:flutter/material.dart';
import 'package:notekeeper/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Log out",
    content: "Are you sure you want to log out?",
    optionBuilder: () => {
      'Cancel': false,
      'Log out': true,
    },
  ).then((value) =>
      value ??
      false); // to set default value as null if user just closes dialog
  //cause it must return a value of bool, no matter what.
}
