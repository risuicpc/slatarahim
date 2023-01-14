import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localstorage/localstorage.dart';
import 'package:slatarahim/classes/language.dart';
import 'package:slatarahim/classes/progress.dart';
import 'package:slatarahim/pages/family_page.dart';
import 'package:slatarahim/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  final LocalStorage _storage = LocalStorage('store');
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    await _storage.ready;
    String code = _storage.getItem("languageCode") ?? 'am';
    setState(() {
      _locale = locale(code);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slatarahim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(155, 6, 37, 216),
        ),
        scaffoldBackgroundColor: Colors.white70,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: const NavigationBars(title: "Slattarahim"),
    );
  }
}

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key, required this.title});

  final String title;

  @override
  State<NavigationBars> createState() => _NavigationBarsState();

  static void setHome(BuildContext context) {
    _NavigationBarsState? state =
        context.findAncestorStateOfType<_NavigationBarsState>();
    state?._onItemTapped(0);
  }
}

class _NavigationBarsState extends State<NavigationBars> {
  int _selectedIndex = 0;
  Language? _language;
  final LocalStorage _storage = LocalStorage('store');

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      _onItemTapped(0);
      return false;
    } else {
      return true;
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Family(),
    Text(
      'Coming soon',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() async {
    await _storage.ready;
    String code = _storage.getItem("languageCode") ?? 'am';
    setState(() {
      _language = language(code);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _storage.ready,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Progress();
        }
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: kToolbarHeight * 0.85,
              title: Text(trans(context).slatarahim),
              actions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: DropdownButton<Language>(
                    value: _language,
                    underline: Container(),
                    iconEnabledColor: Colors.white,
                    dropdownColor: const Color.fromARGB(255, 9, 57, 158),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: const TextStyle(color: Colors.white),
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (var newValue) {
                      _language = newValue!;
                      MyApp.setLocale(context, Locale(newValue.code, ''));
                      _storage.setItem("languageCode", newValue.code);
                    },
                  ),
                ),
              ],
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: trans(context).home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.family_restroom),
                  label: trans(context).family,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_add),
                  label: trans(context).addFamily,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
