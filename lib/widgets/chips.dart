import 'package:flutter/material.dart';

class ChipSelection extends StatefulWidget {
  final List<String> categories;

  const ChipSelection({Key? key, required this.categories}) : super(key: key);

  @override
  _ChipSelectionState createState() => _ChipSelectionState();
}

class _ChipSelectionState extends State<ChipSelection> {
  int selectedIndex = -1; // Initialize selectedIndex with a default value

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              3,
              (int index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(
                        widget.categories[index],
                        style: TextStyle(
                          color: selectedIndex == index ? Colors.white : Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      selected: selectedIndex == index,
                      selectedColor: const Color.fromRGBO(220, 125, 87, 0.8),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: selectedIndex == index ? Colors.transparent : const Color(0x33213D68),
                          width: 1.0,
                        ),
                      ),
                      showCheckmark: false, // This line removes the tick icon
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = selected ? index : -1;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              3,
              (int index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(
                        widget.categories[index + 3], // Index offset for the second row
                        style: TextStyle(
                          color: selectedIndex == index + 3 ? Colors.white : Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      selected: selectedIndex == index + 3,
                      selectedColor: const Color.fromRGBO(220, 125, 87, 0.8),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: selectedIndex == index + 3 ? Colors.transparent : const Color(0x33213D68),
                          width: 1.0,
                        ),
                      ),
                      showCheckmark: false, // This line removes the tick icon
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = selected ? index + 3 : -1;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
