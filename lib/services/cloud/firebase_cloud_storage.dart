import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notekeeper/services/cloud/cloud_note.dart';
import 'package:notekeeper/services/cloud/cloud_storage_constants.dart';
import 'package:notekeeper/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  // this collection must be already created on your firebase project console.
  final notes = FirebaseFirestore.instance.collection('notes');

  Future<void> updateNote({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUdpateNoteException();
    }
  }

  Future<void> deleteNote({required String documentId}) async {
    try {
      notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }

  //set up stream, we basically subscribe to snapshots.
  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map((event) => event.docs
          .map((doc) => CloudNote.fromSnapshot(doc))
          .where((note) => note.ownerUserId == ownerUserId));
  //with the where we are only getting the notes from user.

  Future<Iterable<CloudNote>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then((value) => value.docs.map((doc) {
                return CloudNote.fromSnapshot(doc);
                // return CloudNote(
                //   documentId: doc.id,
                //   ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                //   text: doc.data()[textFieldName] as String,
                // );
              }));
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  Future<CloudNote> createNewNote({required String ownerUserId}) async {
    final document = await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });

    final fetchedNote = await document.get();
    return CloudNote(
        documentId: fetchedNote.id, ownerUserId: ownerUserId, text: '');
  }

  //lets make it a singleton
  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  //setting up a sinleton, meaning one will be the provider for the whole app
  FirebaseCloudStorage._sharedInstance();
  //when user initializes they basically just get a shared, which is kind of the global instance
  factory FirebaseCloudStorage() => _shared;
}
