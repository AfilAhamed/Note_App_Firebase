import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/crud_controller.dart';
import 'package:note_app/helpers/styles.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/add_screen.dart/add_note_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<CrudController>(context);
    return Scaffold(
      backgroundColor: AppStyles().mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('FireNotes'),
        backgroundColor: AppStyles().mainColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 20,
            ),
            child: Text(
              'Your Recent Notes',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: GridView.builder(
                  itemCount: homeProvider.noteList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 0.0,
                    // mainAxisSpacing: 0.0,
                    // childAspectRatio: 0.9
                  ),
                  itemBuilder: (context, index) {
                    final NoteModel data = homeProvider.noteList[index];
                    return Container(
                      padding: const EdgeInsets.only(
                        left: 6,
                        bottom: 2,
                      ),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppStyles().cardsColor[
                              index % AppStyles().cardsColor.length]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.title.toString(),
                                style: AppStyles().cardTitle,
                              ),
                              PopupMenuButton(onSelected: (value) {
                                if (value == 'Delete') {
                                  homeProvider.deleteNotes(data.id);
                                } else {}
                              }, itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                      value: 'Edit', child: Text('Edit')),
                                  const PopupMenuItem(
                                      value: 'Delete', child: Text('Delete'))
                                ];
                              })
                            ],
                          ),
                          Text(
                            data.date.toString(),
                            style: AppStyles().cardDate,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            data.description.toString(),
                            style: AppStyles().cardDescription,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          shape: const StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2)),
          backgroundColor: AppStyles().mainColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNotesScreen()));
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Notes')),
    );
  }
}
