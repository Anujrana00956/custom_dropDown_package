Custom_DropDown_FLutter

Custom_dropdown_flutter is the customize the drop down that always open in downside of field.

![Simulator Screenshot - iPhone 16 - 2025-05-13 at 13 07 27](https://github.com/user-attachments/assets/d20ae19f-ec22-43af-a47b-67f8f4f12b7d)


Getting started

To use this package, add Custom_DropDown_Flutter as a dependency in your pubspec.yaml file.

Usage

Minimal example:

    CustomDropDown(
              itemsList: [
                "Apple",
                "Oranges",
                "Grapes",
                "Mango",
                "Papaya",
                "Kiwi",
              ],
            ),
Custom settings:

    CustomDropDown(
              borderRadiusBelow: 12,
              borderRadiusTop: 15,
              hintText: "select Fruits",
              icons: Icons.arrow_downward_outlined,
              menuBackColor: Colors.yellow,
              buttonBackColor: Colors.red,
              style: TextStyle(fontSize: 16,color: Colors.white),
              itemsList: [
                "Apple",
                "Oranges",
                "Grapes",
                "Mango",
                "Papaya",
                "Kiwi",
              ],
            ),
