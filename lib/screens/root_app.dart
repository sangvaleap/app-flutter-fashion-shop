
import 'package:fashion_store/screens/account.dart';
import 'package:fashion_store/screens/home.dart';
import 'package:fashion_store/theme/color.dart';
import 'package:fashion_store/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "icon" : "assets/icons/home.svg",
      "active_icon" : "assets/icons/home.svg",
      "page" : HomePage(),
      "title" : ""
    },
    {
      "icon" : "assets/icons/search.svg",
      "active_icon" : "assets/icons/search.svg",
      "page" : Container(),
      "title" : ""
    },
    {
      "icon" : "assets/icons/bag.svg",
      "active_icon" : "assets/icons/bag.svg",
      "page" : Container(),
      "title" : ""
    },
    {
      "icon" : "assets/icons/profile.svg",
      "active_icon" : "assets/icons/profile.svg",
      "page" : AccountPage(),
      "title" : ""
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: getBottomBar(),
      body: getBarPage()
    );
  }

  void onPageChanged(int index) {
    setState(() {
      activeTab = index;
    });
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), 
          topRight: Radius.circular(25)
        ), 
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(1, 1)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15,),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(barItems.length, 
            (index) => BottomBarItem( activeTab == index ? barItems[index]["active_icon"] : barItems[index]["icon"], "", isActive: activeTab == index, activeColor: primary,
              onTap: (){
                onPageChanged(index);
              },
            )
          )
          )
        ),
    );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: activeTab,
        children: 
          List.generate(barItems.length, 
            (index) => (barItems[index]["page"])
          )
      );
  }

}