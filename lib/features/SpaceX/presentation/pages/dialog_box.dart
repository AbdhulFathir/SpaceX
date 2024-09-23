import 'package:flutter/material.dart';
import 'Launches_page/launch_home.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yeah! Welcome '),
      content: const Text('You login successfully into  app',
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black54)),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LaunchHome(),
                ));
          }, // function used to perform after pressing the button
          child: Center(
            child: Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: const Center(
                  child: Text('Go To Home',
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ],
    );
  }
}
