class CloudStorageException implements Exception {
  const CloudStorageException();
}

class CouldNotCreateNoteException extends CloudStorageException {}

class CouldNotGetAllNotesException extends CloudStorageException {}

class CouldNotUdpateNoteException extends CloudStorageException {}

class CouldNotDeleteNoteException extends CloudStorageException {}
