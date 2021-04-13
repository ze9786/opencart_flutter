import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset('images/logo.png'),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 100),
          ListTile(
            title: Text('About us'),
          ),
          ExpansionTile(
            title: Text('Product'),
            childrenPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
            expandedAlignment: Alignment.centerLeft,
            children: [
              Text('product 1'),
              SizedBox(
                height: 5,
              ),
              Text('product 2'),
            ],
          ),
          ListTile(
            title: Text('Service'),
          ),
          ListTile(
            title: Text('Contact us'),
          ),
          ExpansionTile(
            title: Text('Language'),
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
            children: [
              Text('English'),
              SizedBox(
                height: 5,
              ),
              Text('繁體中文'),
              SizedBox(
                height: 5,
              ),
              Text('简体中文'),
            ],
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(FontAwesomeIcons.instagram, color: Colors.white)
                ],
              ),
            ),
          ))
        ],
      )),
      body: WebView(
        initialUrl: 'http://zelina.itechdatahk.com/shoppingcart/upload/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
