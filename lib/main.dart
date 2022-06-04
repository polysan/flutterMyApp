import 'package:flutter/material.dart';
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
        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          // 上下中央寄せ
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // アイコン表示
            const Icon(
                Icons.access_alarm_outlined,
                color: Colors.redAccent,
                size:150
            ),
            // フォルダから画像を表示
            Image.asset('images/crown.jpg'),
            // web上から画像を貼り付け①
            // const Image(
            //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            // ),
            // web上から画像を貼り付け②
            // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            Text(text),
            RaisedButton (
              child: const Text('次へ'),
              onPressed: () async {
                // 画面遷移する方法②
                // Navigator.pushNamed(context, '/nextpage');
                // 画面遷移する方法①
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NextPage('次へ渡す値')
                  ),
                );
                // text = result;
                print(result);
                // setStateをつけないと値が反映されない
                setState(() {
                  text = result;
                });
              },
            ),
          ],
        ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add)
      ),
    );
  }
}
