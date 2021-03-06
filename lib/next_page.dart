import 'package:flutter/material.dart';
import 'package:wolf/third_page.dart';

class NextPage extends StatelessWidget {
  // NextPageを作るときにnameを入れるようにする
  NextPage(this.name);

  final String name;
  var text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('次の画面'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: const Text(
                'レッドテールキャット',
                // 文字の右寄せ（コンテナの中でwidth: double.infinityを指定しないと効かない？）
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text(name),
            // テキストのスタイルを変える
            const Text('コリドラス',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold)),
            const Text('クラウンローチ',
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline)),
            // 共通のスタイルを指定
            DefaultTextStyle(
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
                child: Column(
                  children: const [
                    Text('グッピー'),
                    Text('ミナミヌマエビ'),
                    Text('オスカー'),
                  ],
                )),
            Center(
              child: Column(
                children: [
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
                            builder: (context) => thirdPage('次へ渡す値')),
                      );
                      // text = result;
                      print(result);
                      text = result;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
