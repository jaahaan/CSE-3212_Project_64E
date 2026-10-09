import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Page"),
        backgroundColor: const Color.fromARGB(255, 162, 195, 212),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(width: 3, color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: RadialGradient(
              colors: [Colors.lightBlue, Colors.blue, Colors.blueGrey],
            ),
            // shape: BoxShape.circle,
          ),
          child: Text("Welcome Container"),
        ),
      ),
    );
  }
}
