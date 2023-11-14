import 'package:flutter/material.dart';

class MyApp3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState3();
  }
}

class _MyAppState3 extends State<MyApp3> {
  @override
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var pagess = [FirstTab(), SecondTab(), ThirdTab()];

    var pageView = PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: pagess,
    );

    var bottomNav = BottomNavigationBar(
      onTap: (tabIndex) {
        setState(() {
          _currentIndex = tabIndex;
        });
        _pageController.jumpToPage(tabIndex);
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Start"),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance), label: "Second"),
        BottomNavigationBarItem(icon: Icon(Icons.offline_pin), label: "Home"),
      ],
    );

    return MaterialApp(
        home: Scaffold(
      body: pageView,
      bottomNavigationBar: bottomNav,
    ));
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("dsfa"),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("dsfa"),
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("dsfa"),
      ),
    );
  }
}
