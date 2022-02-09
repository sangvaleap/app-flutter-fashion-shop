import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_store/theme/color.dart';
import 'package:fashion_store/utils/data.dart';
import 'package:fashion_store/widgets/collection_box.dart';
import 'package:fashion_store/widgets/new_item.dart';
import 'package:fashion_store/widgets/notification_box.dart';
import 'package:fashion_store/widgets/popular_item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      )
    );
  }

  Widget getAppBar(){
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: labelColor, size: 20,),
                      SizedBox(width: 5,),
                      Text(profile["name"]!, style: TextStyle(color: labelColor, fontSize: 13,),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Good Morning!", style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 18,)),
                ],
              )
            ),
            NotificationBox(
              notifiedNumber: 1,
              onTap: () {
                
              },
            )
          ],
        ),
      );
  }

  buildBody(){
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 20,),
                getCollections(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
                  child: Text("Popular", style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                ),
                getPopulars(),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textColor),),
                      Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                    ],
                  ),
                ),
                getNewItems(),
              ]
          ),
        ),
      );
  }

  getCollections(){
    return 
      SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(collections.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CollectionBox(data: collections[index])
            ) 
          )
        ),
      );
  }

  getPopulars(){
    return 
      CarouselSlider(
        options: CarouselOptions(
          height: 370,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: List.generate(populars.length, 
          (index) => PopularItem(data: populars[index],
            onTap: (){
               
              },
          ),
        )
      );
  }

  getNewItems(){
    return
    SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(news.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: NewItem(
                data: news[index],
                onTap: (){
                 
                },
              )
            ) 
          )
        ),
      );
  }

}