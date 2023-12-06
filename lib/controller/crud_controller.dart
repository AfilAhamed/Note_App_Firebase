import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/services/crud_services.dart';

class CrudController extends ChangeNotifier {
  CrudController() {
    getNotes();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<NoteModel> noteList = [];

  // add note function
  void addNotes() {
    CrudServices().addNotesToDb(
        titleController.text, dateController.text, descriptionController.text);
    getNotes();
    notifyListeners();
  }

  //get note function
  Future<void> getNotes() async {
    noteList = await CrudServices().fetchNotes();
    notifyListeners();
  }

  //delete note function
  void deleteNotes(String id) {
    CrudServices().deleteNotesFromDb(id);
    getNotes();
    notifyListeners();
  }

  //update
  void update(String id) {
    CrudServices().updateNotes(id, titleController.text, dateController.text,
        descriptionController.text);
    getNotes();
    notifyListeners();
  }
}
