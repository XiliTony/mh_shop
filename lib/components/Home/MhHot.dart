import 'package:flutter/material.dart';

class MhHot extends StatefulWidget {
  const MhHot({super.key});

  @override
  _MhHotState createState() => _MhHotState();
}

class _MhHotState extends State<MhHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("爆款推荐", style: TextStyle(color: Colors.white)),
    );
  }
}