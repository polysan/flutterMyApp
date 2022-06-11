import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolf/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 画面遷移する方法①
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // 画面遷移する方法②
      /*initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/nextpage': (context) => NextPage(),
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState(() {
    //   _counter++;
    // });
  }

  String text = '最初';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.circle, color: Colors.green, size: 30),
            Icon(Icons.clear, color: Colors.red, size: 30),
            Text('ゲーム')
          ],
        ),
      ),
      body: buildField(),
    );
  }

  Column buildField() {
    // 変数名の先頭にアンダースコア_をつけることでprivate変数として扱うことができる
    /// 縦の3列を作成するリスト
    List<Widget>_columnChildren = [];
    /// 横の３列を作成するリスト
    List<Widget>_rowChildren = [];

    // 縦の３列を作成するループ
    for (int h = 0; h < 3; h++) {
      // 横の３列を作成するループ
      for(int i = 0; i < 3; i++) {
        _rowChildren.add(
            Expanded(
                child: AspectRatio(
                    aspectRatio: 1.0,
                    child: i == 2
                        ? Container()
                        :Row(
                      children: [
                        Expanded(child: Container()),
                        VerticalDivider(width: 0.0,color: Colors.black),
                      ],
                    )
                )
            )
        );
      }
      _columnChildren.add(Row(children: _rowChildren,));
      _columnChildren.add(Divider(height: 0.0, color: Colors.black,));
      _rowChildren = [];

    }
    return Column(children: _columnChildren,);
  }
}

//todo フィールドのUI作成をメソッドを用いて簡潔に
//todo ターンの表示とクリアボタンの作成
//todo マス目をタップ可能にし、タップ時にターン切り替え
//todo マス目タップでマルバツを表示
//todo ゲームの勝敗のパターンを書き出す
//todo ゲームの勝敗を判定可能に
//todo リセットボタンタップでリスタート可能に
//todo 勝敗をわかりやすく表示
