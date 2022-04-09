import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:notekeeper/constants/routes.dart';
import 'package:notekeeper/services/auth/auth_service.dart';
import 'package:notekeeper/services/crud/notes_service.dart';

import '../enums/menu_actions.dart'; //as devtools is optional

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  // expose the user email
  late final NotesService _notesService;
  //we know it should be there cause otherwise there is no access to this view
  String get userEmail => AuthService.firebase().currentUser!.email!;
  //open the database
  @override
  void initState() {
    _notesService = NotesService();
    _notesService.open();
    super.initState();
  }

  @override
  void dispose() {
    _notesService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            devtools.log(value.toString());
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                }
                break;
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log out'))
            ];
          })
        ],
      ),
      body: FutureBuilder(
        future: _notesService.getOrCreateUser(email: userEmail),
        builder: (context, snaphot) {
          switch (snaphot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                stream: _notesService.allNotes,
                builder: (context, snapshot) {
                  switch (snaphot.connectionState) {
                    case ConnectionState.done:
                      return const Text('your notes');
                    case ConnectionState.waiting:
                      return const Text('Waiting fo all notes...');
                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log out'))
          ],
        );
      }).then((value) => value ?? false);
}
