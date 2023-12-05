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

  void addNotes() {
    CrudServices().addNotesToDb(
        titleController.text, dateController.text, descriptionController.text);
    getNotes();
    titleController.clear();
    dateController.clear();
    descriptionController.clear();

    notifyListeners();
  }

  Future<void> getNotes() async {
    noteList = await CrudServices().fetchNotes();
    notifyListeners();
  }

  deleteNotes(id) {
    CrudServices().deleteNotesFromDb(id);
    getNotes();
    notifyListeners();
  }
}
