import 'package:flutter/material.dart';
import 'package:note_app/controller/crud_controller.dart';
import 'package:note_app/helpers/styles.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen(
      {super.key,
      required this.name,
      required this.date,
      required this.description,
      required this.id});

  final String? name;
  final String? date;
  final String? description;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final editProvider = Provider.of<CrudController>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    editProvider.titleController.text = name!;
    editProvider.dateController.text = date!;
    editProvider.descriptionController.text = description!;

    return Scaffold(
      backgroundColor: AppStyles().mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles().mainColor,
        title: const Text('Edit Notes'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Title';
                } else {
                  return null;
                }
              },
              controller: editProvider.titleController,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      editProvider.titleController.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Title'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Date';
                } else {
                  return null;
                }
              },
              controller: editProvider.dateController,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      editProvider.dateController.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Date'),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Description';
                } else {
                  return null;
                }
              },
              controller: editProvider.descriptionController,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 6,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      editProvider.descriptionController.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Description'),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles().mainColor,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.white, width: 2)),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      editProvider.update(id.toString());

                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
