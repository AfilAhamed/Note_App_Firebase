import 'package:flutter/material.dart';
import 'package:note_app/controller/crud_controller.dart';
import 'package:note_app/helpers/styles.dart';
import 'package:provider/provider.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addUserProvider = Provider.of<CrudController>(context);
    return Scaffold(
      backgroundColor: AppStyles().mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles().mainColor,
        title: const Text('Add Notes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: addUserProvider.titleController,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    addUserProvider.titleController.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
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
            controller: addUserProvider.dateController,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    addUserProvider.dateController.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
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
            controller: addUserProvider.descriptionController,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 6,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    addUserProvider.descriptionController.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
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
                  addUserProvider.addNotes();
                  Navigator.pop(context);
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
