import 'package:flutter/material.dart';
import './pages/BookScreen.dart';
import './pages/CakeScreen.dart';
import './pages/CloudScreen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  // ページインデックス保存用
  int _screen = 0;
  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    BookScreen(),
    CloudScreen(),
    CakeScreen()
  ];
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Book',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        label: 'Cloud',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cake),
        label: 'Cake',
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'BottomNav',
          style: TextStyle(fontSize: 16),
        ),
      ),
      // ページビュー
      body: _pageList[_screen],
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}