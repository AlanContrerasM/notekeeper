import 'package:flutter/material.dart';
import 'package:notekeeper/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Delete",
    content: "Are you sure you want to delete this item?",
    optionBuilder: () => {
      'Cancel': false,
      'Yes': true,
    },
  ).then((value) =>
      value ??
      false); // to set default value as null if user just closes dialog
  //cause it must return a value of bool, no matter what.
}
