import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CircularCustom extends StatefulWidget {
  const CircularCustom({super.key});

  @override
  State<CircularCustom> createState() => _CircularCustomState();
}

class _CircularCustomState extends State<CircularCustom> {
  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentPickerColor = const Color(0xff443a49);

  double _currentSliderValue = 20;

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Circular Progress Custom'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                const Text('Select Color'),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    showDialogColor();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: currentPickerColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text('Select Size'),
                const SizedBox(
                  width: 30,
                ),
                Slider(
                  thumbColor: currentPickerColor,
                  value: _currentSliderValue,
                  min: 10,
                  max: 200,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: SizedBox(
                width: _currentSliderValue,
                height: _currentSliderValue,
                child: CircularProgressIndicator(
                  color: currentPickerColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future showDialogColor() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() => currentPickerColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
