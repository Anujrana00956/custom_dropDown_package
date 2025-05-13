import 'package:custom_dropdown_flutter/custom_dropdown_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MycustomDropdown());

class MycustomDropdown extends StatelessWidget {
  const MycustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 104, 203, 125),
        appBar: AppBar(
          title: Text("Custom DropDown"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomDropDown(
              itemsList: [
                "Apple",
                "Oranges",
                "Grapes",
                "Mango",
                "Papaya",
                "Kiwi",
              ],
            ),
          ),
        ),
      ),
    );
  }
}
