import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:trivial_pursuit_flutter/ui/pages/learderboard/leaderboard.dart';

void main() {
  runApp(const MyApp());
}

//2A303C

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  static var themeColor = generateMaterialColor(color: const Color(0x000f1729));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(15, 23, 41, 0),
        primarySwatch: themeColor,
      ),
      darkTheme: ThemeData(
          primarySwatch: themeColor,
          backgroundColor: const Color.fromRGBO(15, 23, 41, 1)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Leaderboard(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  final Color _itemColor = Colors.deepOrangeAccent;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home-variant.svg',
                color: _selectedIndex == 0 ? _itemColor : Colors.black),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/poll.svg',
                color: _selectedIndex == 1 ? _itemColor : Colors.black),
            label: 'Classement',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/account.svg',
                color: _selectedIndex == 2 ? _itemColor : Colors.black),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: (_widgetOptions.elementAt(_selectedIndex)),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
