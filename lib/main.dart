import 'package:flutter/cupertino.dart';
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
  bool turnOfCircle = true;

  String text = '最初';

  @override
  // build；UIを表示
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    turnOfCircle ? Icon(FontAwesomeIcons.circle) : Icon(Icons.clear),
                    Text('の番です'),
                  ],
                ),
                OutlineButton(
                    borderSide: BorderSide(),
                    child: Text('クリア'),
                    onPressed: (){

                  }
                )
              ],
            ),
          ),
          buildField(),
        ],
      ),
    );
  }

  Column buildField() {
    // 変数名の先頭にアンダースコア_をつけることでprivate変数として扱うことができる
    /// 縦の3列を作成するリスト
    List<Widget>_columnChildren = [Divider(height: 0.0, color: Colors.black)];
    /// 横の３列を作成するリスト
    List<Widget>_rowChildren = [];

    // 縦の３列を作成するループ
    for (int h = 0; h < 3; h++) {
      // 横の３列を作成するループ
      for(int i = 0; i < 3; i++) {
        _rowChildren.add(
            Expanded(
                // InkWell：クリックできないUIをクリックできるようにする
                child: InkWell(
                  onTap: (){
                    turnOfCircle = !turnOfCircle;
                    setState(() {
                    });
                  },
                  // AspectRatio：正方形にしている
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
                  ),
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

//todo マス目タップでマルバツを表示
//todo ゲームの勝敗のパターンを書き出す
//todo ゲームの勝敗を判定可能に
//todo リセットボタンタップでリスタート可能に
//todo 勝敗をわかりやすく表示
