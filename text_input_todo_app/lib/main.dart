import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: TextInputWidget(),
    );
  }
}

//画面用の自作Widget
class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});
  @override
  State createState() => _TextInputWidgetState();
}

//textinputWidgetのStatekulass
class _TextInputWidgetState extends State<TextInputWidget> {
  final _controller = TextEditingController();
  List todoList = ["name"];

  @override
  void initState() {
    super.initState();
    _controller.text = '初期値が入っています';
  }

  //画面のUIを構築するbuildメソッド
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(title: const Text('Text Input Sample')),
      body: ListView.builder(
        itemCount: todoList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == todoList.length) {
            // リスト一覧の最後のindexにTextFieldを作成
            return _createTextArea();
          } else {
            // それ以外はTodoカードを作成
            var title = todoList[index];
            return _createTodoCard(title);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

//todoカードを作成するWidget
  Widget _createTodoCard(String title) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(title: Text(title)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // 完了したときの処理
                    },
                    child: const Text('完了')),
                ElevatedButton(
                    onPressed: () {
                      // 削除したときの処理
                    },
                    child: const Text('削除'))
              ],
            )
          ],
        ));
  }

  Widget _createTextArea() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: '入力してください'),
        onChanged: (String value) {
          print(value);
        },
        onSubmitted: (String value) {
          setState(() {
            if (value.isEmpty == false) {
              todoList.add(value);
              _controller.clear();
            }
          });
        },
      ),
    );
  }
}
