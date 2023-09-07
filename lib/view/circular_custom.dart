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
  Color currentColor = const Color(0xff443a49);

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
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Change Color',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Text('Select Size'),
                SizedBox(
                  width: 30,
                ),
                Text('Size Picker')
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: currentColor,
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
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
