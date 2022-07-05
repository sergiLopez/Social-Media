import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:instagram_flutter/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTap(int page){
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: navigationTap,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _page == 0 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _page == 1 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: _page == 2 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: _page == 3 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _page == 4 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
        ],
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: homeScreenItems,
  
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
