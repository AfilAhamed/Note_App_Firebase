import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/model/note_model.dart';

class CrudServices {
  final CollectionReference firebaseDatas =
      FirebaseFirestore.instance.collection('Note');

  //add to databse

  void addNotesToDb(String addTitle, String addDate, String addDescription) {
    final data = NoteModel(
            id: '', title: addTitle, date: addDate, description: addDescription)
        .toJson();
    firebaseDatas.add(data);
  }

  //fetch notes from Database
  Future<List<NoteModel>> fetchNotes() async {
    final data = await firebaseDatas.orderBy('title').get();
    return data.docs
        .map((value) =>
            NoteModel.fromJson(value.data() as Map<String, dynamic>, value.id))
        .toList();
  }

  //delete notes from Databse

  void deleteNotesFromDb(id) {
    firebaseDatas.doc(id).delete();
  }
}
