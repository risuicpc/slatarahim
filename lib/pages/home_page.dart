import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:slatarahim/classes/language.dart';
import 'package:slatarahim/classes/quraan.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const TextStyle arabicStyle = TextStyle(
    fontSize: 15.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/kaaba.png',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection(context),
          buttonSection(context),
          textSection(Quraan.quraanList()[0], context),
          textSection(Quraan.quraanList()[1], context),
        ],
      ),
    );
  }
}

Widget titleSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  trans(context).noGod,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                trans(context).messengerOfAllah,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buttonSection(BuildContext context) {
  void dialog(type) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(jsonDecode(trans(context).dialog)[type]["title"]),
        content: Text(
          jsonDecode(trans(context).dialog)[type]["text"],
          style: const TextStyle(fontSize: 15),
        ),
      ),
    ));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(
        Colors.blue,
        Icons.star,
        trans(context).islam,
        dialog,
        "islam",
      ),
      _buildButtonColumn(
        Colors.blue,
        Icons.favorite,
        trans(context).iman,
        dialog,
        "iman",
      ),
      _buildButtonColumn(
        Colors.blue,
        Icons.visibility,
        trans(context).ihsan,
        dialog,
        "ihsan",
      ),
    ],
  );
}

TextButton _buildButtonColumn(
    Color color, IconData icon, String label, dialog, type) {
  return TextButton(
    onPressed: () => dialog(type),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textSection(quraan, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(16.0),
    color: Colors.black12,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              quraan.arabic,
              softWrap: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 15.5),
            ),
          ),
          Text(
            jsonDecode(trans(context).quraan)[quraan.trans],
            softWrap: true,
          ),
        ],
      ),
    ),
  );
}
