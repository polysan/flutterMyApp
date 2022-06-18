import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolf/model.dart';
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
  String text = '最初';

  bool turnOfCircle = true;
  // filled：要素を埋めるメソッド
  List<PieceStatus> statusList = List.filled(9, PieceStatus.none);
  GameStatus gameStatus = GameStatus.play;

  final List<List<int>> settlementListHorizontal = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
  ];

  final List<List<int>> settlementListVertical = [
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ];

  final List<List<int>> settlementListDiagonal = [
    [0,4,8],
    [2,4,6],
  ];



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
                buildText(),
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

  Widget buildText() {
    switch(gameStatus){
      case GameStatus.play:
        return Row(
          children: [
            turnOfCircle ? Icon(FontAwesomeIcons.circle) : Icon(Icons.clear),
            Text('の番です'),
          ],
        );
      case GameStatus.draw:
        return Text('引き分けです');
      case GameStatus.settlement:
      return Row(
        children: [
          !turnOfCircle ? Icon(FontAwesomeIcons.circle) : Icon(Icons.clear),
          Text('の勝ちです'),
        ],
      );
      default:
      return Container();
    }
  }

///  関数
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
       int _index = h * 3 + i;
        _rowChildren.add(
            Expanded(
                // InkWell：クリックできないUIをクリックできるようにする
                child: InkWell(
                  onTap: gameStatus == GameStatus.play ? (){
                    if(statusList[_index] == PieceStatus.none) {
                      statusList[_index] = turnOfCircle ? PieceStatus.circle : PieceStatus.cross;
                      turnOfCircle = !turnOfCircle;
                      confirmResult();
                    }
                    setState(() {});
                  } : null,
                  // AspectRatio：正方形にしている
                  child: AspectRatio(
                      aspectRatio: 1.0,
                      child:Row(
                        children: [
                          Expanded(
                              child: buildContainer(statusList[_index])
                  ),
                    (i == 2) ? Container() : VerticalDivider(width: 0.0,color: Colors.black),
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

  Container buildContainer(PieceStatus pieceStatus){
    switch(pieceStatus){
      case PieceStatus.none:
        return Container();
      case PieceStatus.circle:
        return Container(
          child: Icon(FontAwesomeIcons.circle, size:60, color: Colors.blue,),
        );
      case PieceStatus.cross:
        return Container(
          child: Icon(Icons.clear, size: 60, color: Colors.red),
        );
        default:return Container();
    }
  }
  void confirmResult () {
    if(!statusList.contains(PieceStatus.none)){
      gameStatus = GameStatus.draw;
    }
    // 行における勝敗パターン
    for(int i = 0; i < settlementListHorizontal.length; i++) {
      if(statusList[settlementListHorizontal[i][0]] == statusList[settlementListHorizontal[i][1]]
        && statusList[settlementListHorizontal[i][1]] == statusList[settlementListHorizontal[i][2]]
        && statusList[settlementListHorizontal[i][0]] != PieceStatus.none
      ){
        gameStatus = GameStatus.settlement;
      }
      // 列における勝敗パターン
    }for(int i = 0; i < settlementListVertical.length; i++) {
      if(statusList[settlementListVertical[i][0]] == statusList[settlementListVertical[i][1]]
        && statusList[settlementListVertical[i][1]] == statusList[settlementListVertical[i][2]]
        && statusList[settlementListVertical[i][0]] != PieceStatus.none
      ){
        gameStatus = GameStatus.settlement;
      }
      // 斜めにおける勝敗パターン
    }for(int i = 0; i < settlementListDiagonal.length; i++) {
      if(statusList[settlementListDiagonal[i][0]] == statusList[settlementListDiagonal[i][1]]
        && statusList[settlementListDiagonal[i][1]] == statusList[settlementListDiagonal[i][2]]
        && statusList[settlementListDiagonal[i][0]] != PieceStatus.none
      ){
        gameStatus = GameStatus.settlement;
      }
    }
  }
}


//todo リセットボタンタップでリスタート可能に
//todo 勝敗をわかりやすく表示
