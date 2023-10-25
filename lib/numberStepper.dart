import 'package:flutter/material.dart';

class NumberStepper extends StatefulWidget {
  const NumberStepper(
      {super.key, required this.initialValue, required this.onChanged});

  final int initialValue;
  final Function(int) onChanged;

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                _currentValue--;
                widget.onChanged(_currentValue);
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            )),
        const SizedBox(width: 20),
        IconButton(
            onPressed: () {
              setState(() {
                _currentValue++;
                widget.onChanged(_currentValue);
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(Icons.add_circle, color: Colors.green)),
      ],
    );
  }
}
