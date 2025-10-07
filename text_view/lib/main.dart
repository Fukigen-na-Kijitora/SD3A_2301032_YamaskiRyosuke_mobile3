import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Sample',
      home: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  String inputValue = ''; // 入力内容を保持する変数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Input Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  inputValue = value; // 入力が変わるたびに反映
                });
                print(value); // 元コードのprintも残す
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'テキストを入力してください',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '入力内容: $inputValue',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
