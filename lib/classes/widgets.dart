import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:slatarahim/classes/profile.dart';
import 'package:slatarahim/classes/language.dart';

Widget myProfile(BuildContext context, profile, makingPhoneCall) {
  List<String> father = ancestors(profile.father);
  List<String> mother = ancestors(profile.mother);
  int countSon, countDaughter;

  if (profile.gender == "male") {
    List<Profile> children = Profile.familyList()
        .where(
          (e) => e.father == profile.id,
        )
        .toList();
    countSon = children.where((e) => e.gender == "male").length;
    countDaughter = children.length - countSon;
  } else {
    List<Profile> children = Profile.familyList()
        .where(
          (e) => e.mother == profile.id,
        )
        .toList();
    countSon = children.where((e) => e.gender == "male").length;
    countDaughter = children.length - countSon;
  }

  int getCount(son, daughter) {
    if (son == 1 && daughter == 1) {
      return 0;
    } else if (son > 1 && daughter == 1) {
      return 1;
    } else if (son == 1 && daughter > 1) {
      return 2;
    } else {
      return 3;
    }
  }

  String numberOfChildren = countSon + countDaughter > 0
      ? countDaughter == 0
          ? trans(context).son(
              profile.gender + (countSon > 1 ? "s" : ""),
              countSon.toString(),
            )
          : countSon == 0
              ? trans(context).daughter(
                  profile.gender + (countDaughter > 1 ? "s" : ""),
                  countDaughter.toString(),
                )
              : trans(context).sonAndDaughter(
                  trans(context).pronouns(profile.gender),
                  trans(context).sonDaughter(
                    getCount(countSon, countDaughter),
                    countSon.toString(),
                    countDaughter.toString(),
                  ),
                )
      : trans(context).noChild(profile.gender);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 32,
              child: Text(
                jsonDecode(trans(context).name)[profile.name][0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jsonDecode(trans(context).name)[profile.name],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 21,
                      ),
                      Text(
                        jsonDecode(trans(context).address)[profile.address],
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            numberOfChildren,
            style: const TextStyle(
              color: Color(0xFFFF8F00),
              fontSize: 16,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                trans(context).mother,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.only(top: 5, right: 7),
                  padding: const EdgeInsets.all(5),
                  color: Colors.black12,
                  child: Text(mother
                      .map((e) => jsonDecode(trans(context).name)[e])
                      .join(" ")),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                trans(context).father,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 5, bottom: 5, right: 7),
                  color: Colors.black12,
                  child: Text(father
                      .map((e) => jsonDecode(trans(context).name)[e])
                      .join(" ")),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                profile.phone,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: profile.phone.length == 0
                  ? Colors.blueGrey
                  : const Color.fromARGB(255, 9, 155, 58),
              child: IconButton(
                alignment: Alignment.center,
                icon: Icon(
                  profile.phone.length == 0 ? Icons.phone_disabled : Icons.call,
                  color: Colors.white,
                ),
                onPressed: profile.phone.length == 0
                    ? null
                    : () => makingPhoneCall(profile.phone),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget myChildren(children, getProfile) {
  return ListView.separated(
    shrinkWrap: true,
    controller: ScrollController(),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
    itemCount: children.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              iconColor: Theme.of(context).primaryColor,
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => getProfile(children[index].id),
              leading: CircleAvatar(
                backgroundColor: Colors.amber[800],
                foregroundColor: Colors.white,
                radius: 22,
                child: Text(
                  jsonDecode(trans(context).name)[children[index].name][0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              title: Text(
                jsonDecode(trans(context).name)[children[index].name],
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Text(
                    jsonDecode(trans(context).address)[children[index].address],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: 15),
  );
}

List<String> ancestors(id) {
  List<String> parents = <String>[];
  while (true) {
    try {
      var parent = Profile.familyList().singleWhere((e) => e.id == id);
      parents.add(parent.name);
      id = parent.father;
      if (id < 3) break;
    } catch (e) {
      break;
    }
  }
  return parents;
}
