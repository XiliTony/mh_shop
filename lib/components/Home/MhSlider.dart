import 'package:flutter/material.dart';

class MhSlider extends StatefulWidget {
  MhSlider({Key? key}) : super(key: key);

  @override
  _MhSliderState createState() => _MhSliderState();
}

class _MhSliderState extends State<MhSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
