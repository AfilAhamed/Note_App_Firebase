class NoteModel {
  String? id;
  String? title;
  String? date;
  String? description;
  NoteModel({
    this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  factory NoteModel.fromJson(Map data, id) {
    return NoteModel(
        id: id,
        title: data['title'],
        date: data['date'],
        description: data['description']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'date': date, 'description': description};
  }
}
