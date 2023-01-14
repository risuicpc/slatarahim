import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:localstorage/localstorage.dart';
import 'package:slatarahim/classes/profile.dart';
import 'package:slatarahim/classes/language.dart';
import 'package:slatarahim/classes/widgets.dart';
import 'package:slatarahim/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  late Profile profile;
  late List<Profile> children;
  late List<Map<String, dynamic>> breadCrumb = <Map<String, dynamic>>[];
  final LocalStorage storage = LocalStorage('store');

  setBackButton() {
    if (breadCrumb.length > 1) {
      int id = breadCrumb[1]["id"];
      breadCrumb.removeRange(0, 2);
      getProfile(id);
    } else {
      NavigationBars.setHome(context);
    }
  }

  @override
  void initState() {
    super.initState();
    int id = storage.getItem('id') ?? 3;
    breadCrumb = breadCrumbs(id);
    getProfile(id);
  }

  void getProfile(int id) {
    var my = Profile.familyList().singleWhere((e) => e.id == id);
    breadCrumb.insert(0, {"id": id, "name": my.name});

    children = Profile.familyList()
        .where((e) => (my.gender == "male" ? e.father : e.mother) == id)
        .toList();

    setState(() {
      profile = my;
    });
    storage.setItem('id', id);
  }

  Future<void> _makingPhoneCall(String phone) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not lunch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Row(
              children: [
                TextButton(
                  onPressed: setBackButton,
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BreadCrumb.builder(
                      itemCount: breadCrumb.length,
                      builder: (index) {
                        return BreadCrumbItem(
                          content: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                minimumSize: const Size(10, 36)),
                            onPressed: () {
                              int id = breadCrumb[index]["id"];
                              breadCrumb.removeRange(0, index + 1);
                              getProfile(id);
                            },
                            child: Text(
                              jsonDecode(trans(context).name)[breadCrumb[index]
                                  ["name"]],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Russo One"),
                            ),
                          ),
                        );
                      },
                      divider: const Icon(Icons.arrow_right),
                      overflow: ScrollableOverflow(
                        reverse: false,
                        direction: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          myProfile(context, profile, _makingPhoneCall),
          Text(
            children.isNotEmpty
                ? "${trans(context).pronoun(profile.gender + (children.length > 1 ? "s" : ""))}!"
                : "",
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 36,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: myChildren(children, getProfile),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> breadCrumbs(id) {
  List<Map<String, dynamic>> breadCrumb = <Map<String, dynamic>>[];
  var my = Profile.familyList().singleWhere((e) => e.id == id);
  while (true) {
    try {
      var f = Profile.familyList().singleWhere((e) => e.id == my.father);
      var m = Profile.familyList().singleWhere((e) => e.id == my.mother);
      my = f.father == 0 ? m : f;
      if (my.id < 3) break;
      breadCrumb.add({"id": my.id, "name": my.name});
    } catch (e) {
      break;
    }
  }
  return breadCrumb;
}
