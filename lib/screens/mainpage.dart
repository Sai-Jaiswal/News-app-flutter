import 'package:flutter/material.dart';
import 'package:flutter_practice_apps/screens/explore.dart';
import 'package:flutter_practice_apps/screens/homepage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final List<StatefulWidget> allPages = [const Homepage(), const ExplorePage()];
  int initialPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // url = https://api.worldnewsapi.com/search-news?api-key=9efbf029139a457abc16fb6a8e319028&text=elon%20musk&number=50

    return Scaffold(
      body: allPages[initialPageIndex],
      bottomNavigationBar: BottomAppBar(
        height: 80,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF091122),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  initialPageIndex = 0;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Image.asset(
                "assets/icons/homepage.png",
                width: 24,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  initialPageIndex = 1;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Image.asset(
                "assets/icons/search-line.png",
                width: 24,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  initialPageIndex = 2;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Image.asset(
                "assets/icons/file-list-3-line.png",
                width: 24,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  initialPageIndex = 3;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Image.asset(
                "assets/icons/account-circle-line.png",
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
