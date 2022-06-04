import 'package:flutter/material.dart';

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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton (
              child: const Text('戻る'),
              onPressed: (){
                Navigator.pop(context,'戻す値aaaaaa');
              },
            ),
          ],
        ),
      ),
    );
  }
}