import 'package:flutter/material.dart';

class MhSuggestion extends StatefulWidget {
  MhSuggestion({Key? key}) : super(key: key);

  @override
  _MhSuggestionState createState() => _MhSuggestionState();
}

class _MhSuggestionState extends State<MhSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        height: 300,
        child: Text("推荐", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
