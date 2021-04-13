import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart/UI/AboutUs.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 100),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
          },
          child: ListTile(
            title: Text('About us'),
          ),
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
    ));
  }
}
