import 'package:flutter/material.dart';
import 'package:wolf/next_page.dart';

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
        // リスト①
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('設定'),
              trailing: Icon(Icons.access_alarm_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage('yosi')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //
        //     RaisedButton(
        //       child: const Text('戻る'),
        //       onPressed: () {
        //         Navigator.pop(context, '4つ目の画面から戻す値');
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
