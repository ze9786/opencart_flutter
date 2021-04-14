import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart/UI/MySplashScreen.dart';
import 'package:opencart/UI/widgets/AboutUs.dart';
import 'package:url_launcher/url_launcher.dart';

import 'UI/widgets/MyWebView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
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
      home: MySplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const _facebookUrl = 'https://www.facebook.com/iTechDataLimited';
const _instagramUrl = 'https://www.instagram.com/itechdatalimited/';
const _whatsappUrl = 'https://api.whatsapp.com/send?phone=85263024604';

void _launchFbURL() async => await canLaunch(_facebookUrl)
    ? await launch(_facebookUrl)
    : throw 'Could not launch $_facebookUrl';
void _launchInstagramURL() async => await canLaunch(_instagramUrl)
    ? await launch(_instagramUrl)
    : throw 'Could not launch $_instagramUrl';
void _launchWhatsappURL() async => await canLaunch(_whatsappUrl)
    ? await launch(_whatsappUrl)
    : throw 'Could not launch $_whatsappUrl';

class _MyHomePageState extends State<MyHomePage> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  int _currentTab = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  bool isSimpChinese;
  bool isTradChinese;
  bool isEng;
  List<Widget> _children;

  @override
  void initState() {
    isSimpChinese = false;
    isTradChinese = false;
    isEng = true;
    _children = [
      MyWebView(url: "http://zelina.itechdatahk.com/shoppingcart/upload/"),
      AboutUs(
          lang: isEng
              ? 'eng'
              : isSimpChinese
                  ? 'simp'
                  : 'trad'),
      MyWebView(
          url:
              'http://zelina.itechdatahk.com/shoppingcart/upload/index.php?route=checkout/cart'),
      MyWebView(
          url:
              'http://zelina.itechdatahk.com/shoppingcart/upload/index.php?route=product/product&path=20_27&product_id=41'),
      MyWebView(
          url:
              'http://zelina.itechdatahk.com/shoppingcart/upload/index.php?route=product/product&path=25_28&product_id=42')
    ];
  }

  void changeLanguage(String lang) {
    setState(() {
      switch (lang) {
        case "eng":
          isEng = true;
          isSimpChinese = false;
          isTradChinese = false;
          break;
        case "trad":
          isTradChinese = true;
          isSimpChinese = false;
          isEng = false;
          break;
        case "simp":
          isSimpChinese = true;
          isTradChinese = false;
          isEng = false;
          break;
        default:
          isEng = true;
          isSimpChinese = false;
          isTradChinese = false;
      }
      _children[1] = AboutUs(
          lang: isEng
              ? 'eng'
              : isSimpChinese
                  ? 'simp'
                  : 'trad');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/logo.png'),
        ),
        endDrawer: Drawer(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onItemTapped(1);
              },
              child: ListTile(
                title: Text(isEng
                    ? 'About us'
                    : isSimpChinese
                        ? '关于我们'
                        : '關於我們'),
              ),
            ),
            ExpansionTile(
              title: Text(isEng
                  ? 'Product'
                  : isTradChinese
                      ? '產品'
                      : '产品'),
              childrenPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              expandedAlignment: Alignment.centerLeft,
              children: [
                GestureDetector(
                  child: Text(isEng
                      ? 'product 1'
                      : isTradChinese
                          ? '產品 1'
                          : '产品 1'),
                  onTap: () {
                    Navigator.pop(context);
                    onItemTapped(3);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: Text(isEng
                      ? 'product 2'
                      : isTradChinese
                          ? '產品 2'
                          : '产品 2'),
                  onTap: () {
                    Navigator.pop(context);
                    onItemTapped(4);
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onItemTapped(2);
              },
              child: ListTile(
                title: Text(isEng
                    ? 'View cart'
                    : isSimpChinese
                        ? '查看购物车'
                        : '查看購物車'),
              ),
            ),
            ListTile(
              title: Text(isEng
                  ? 'Contact us'
                  : isSimpChinese
                      ? '联系我们'
                      : '聯繫我們'),
            ),
            ExpansionTile(
              title: Text(isEng
                  ? 'Language'
                  : isTradChinese
                      ? '語言'
                      : '语言'),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              children: [
                GestureDetector(
                    onTap: () => changeLanguage('eng'), child: Text('English')),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: Text('繁體中文'),
                  onTap: () => changeLanguage('trad'),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: Text('简体中文'),
                  onTap: () => changeLanguage('simp'),
                ),
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
                    GestureDetector(
                      onTap: _launchFbURL,
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: _launchWhatsappURL,
                        child: Icon(FontAwesomeIcons.whatsapp,
                            color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: _launchInstagramURL,
                        child: Icon(FontAwesomeIcons.instagram,
                            color: Colors.white))
                  ],
                ),
              ),
            ))
          ],
        )),
        body: _children[_currentTab]);
  }
}
