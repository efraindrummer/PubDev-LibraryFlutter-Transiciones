import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text('Page2'),
      ),
    );
  }
}