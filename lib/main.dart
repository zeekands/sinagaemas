import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

import 'depan.dart';
import 'login_page.dart';
import 'register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _pageControlller = PageController();

  @override
  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Si Naga Emas Mobile',
      // home: LoginPage(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Si Naga Emas Mobile"),
          backgroundColor: Colors.yellow,
        ),
        body: PageView(
          controller: _pageControlller,
          children: const <Widget>[
            Depan(),
            Register(),
            LoginPage(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          color: const Color.fromARGB(255, 255, 240, 219),
          controller: _pageControlller,
          flat: true,
          useActiveColorByDefault: false,
          items: const [
            RollingBottomBarItem(Icons.home,
                label: 'Home', activeColor: Colors.redAccent),
            RollingBottomBarItem(Icons.app_registration,
                label: 'Register', activeColor: Colors.blueAccent),
            RollingBottomBarItem(Icons.person,
                label: 'Login', activeColor: Colors.green),
          ],
          enableIconRotation: true,
          onTap: (index) {
            _pageControlller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}
