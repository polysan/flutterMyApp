import 'package:flutter/material.dart';

class forthPage extends StatelessWidget {
  // NextPageを作るときにnameを入れるようにする
  forthPage(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4つ目の画面'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.pop(context, '4つ目の画面から戻す値');
              },
            ),
          ],
        ),
      ),
    );
  }
}
