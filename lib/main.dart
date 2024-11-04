import 'package:pbl_hafizh/scan.dart';
import 'package:flutter/material.dart';
import 'package:pbl_hafizh/inbox.dart';
import 'package:pbl_hafizh/music.dart';
import 'package:pbl_hafizh/profile.dart';
import 'package:pbl_hafizh/homepage.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    InboxPage(),
    MusicPage(),
    ProfilePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            ..._pages,
            const CameraScanPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
              _currentIndex = _pages.length;
            });
          },
          child: const Icon(Icons.face),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,
                    color: _currentIndex == 0 ? Colors.blue : Colors.grey),
                onPressed: () => _onTap(0),
              ),
              IconButton(
                icon: Icon(Icons.inbox,
                    color: _currentIndex == 1 ? Colors.blue : Colors.grey),
                onPressed: () => _onTap(1),
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.music_note,
                    color: _currentIndex == 2 ? Colors.blue : Colors.grey),
                onPressed: () => _onTap(2),
              ),
              IconButton(
                icon: Icon(Icons.person,
                    color: _currentIndex == 3 ? Colors.blue : Colors.grey),
                onPressed: () => _onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
