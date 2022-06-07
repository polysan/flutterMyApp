import 'package:flutter/material.dart';
import 'package:wolf/forth_page.dart';

class thirdPage extends StatelessWidget {
  // NextPageを作るときにnameを入れるようにする
  thirdPage(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3つ目の画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: '熱帯魚の名前'
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: '熱帯魚の種類'
              ),
            ),
            RaisedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.pop(context, '戻す値aaaaaa');
              },
            ),
            RaisedButton(
              child: const Text('次へ'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => forthPage('次へ渡す値')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
