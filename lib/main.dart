// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:trivial_pursuit_flutter/ui/pages/learderboard/leaderboard.dart';
import 'package:trivial_pursuit_flutter/ui/pages/profil/profil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ui/pages/games/games_page.dart';
import 'ui/pages/signup/signup_page.dart';
import 'package:beamer/beamer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//2A303C

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  static var themeColor = generateMaterialColor(color: const Color(0x000f1729));

  final routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
    '/': (context, state, date) => const SignupPage(),
    '/home': (context, state, date) => const MyHomePage(
          title: '',
        ),
  }));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(26, 32, 4, 0),
          primarySwatch: themeColor,
        ),
        darkTheme: ThemeData(
            primarySwatch: themeColor,
            backgroundColor: const Color.fromRGBO(15, 23, 41, 1)),
        debugShowCheckedModeBanner: false,
        /*      home: SplashScreen(
            seconds: 3,
            navigateAfterSeconds: const MyHomePage(title: ''),
            image: Image.asset('assets/images/large_trivialistic.png'),
            photoSize: 150.0,
            backgroundColor: Colors.white,
            loaderColor: Colors.blue), */
        routerDelegate: routerDelegate,
        routeInformationParser:
            BeamerParser() // BeamerParser is the default one, but you can use any other one you want.
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
    Leaderboard(),
    const Profil(),
    const GamePage(),
  ];

  final Color _itemColor = const Color.fromRGBO(86, 11, 227, 1);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
         /* BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home-variant.svg',
                color: _selectedIndex == 0 ? _itemColor : Colors.black),
            label: 'Accueil',
          ),*/
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/poll.svg',
                color: _selectedIndex == 0 ? _itemColor : Colors.black),
            label: 'Classement',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/account.svg',
                color: _selectedIndex == 1 ? _itemColor : Colors.black),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games,
                color: _selectedIndex == 2 ? _itemColor : Colors.black),
            label: 'Questions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyApp.themeColor,
        onTap: _onItemTapped,
      ),
      body: (_widgetOptions.elementAt(_selectedIndex)),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
