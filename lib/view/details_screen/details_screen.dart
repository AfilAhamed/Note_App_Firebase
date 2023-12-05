import 'package:flutter/material.dart';

class DetailsScreeen extends StatelessWidget {
  const DetailsScreeen(
      {super.key,
      required this.color,
      required this.title,
      required this.date,
      required this.description});
  final Color? color;
  final String? title;
  final String? date;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: const Text(
            'Details Screen',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: color,
        ),
        body: Center(
          child: Column(
            children: [Text(title!), Text(date!), Text(description!)],
          ),
        ));
  }
}
