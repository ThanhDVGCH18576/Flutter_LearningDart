import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main UI"),
        ),
        body: const Text("UI"),
    );
    }
}