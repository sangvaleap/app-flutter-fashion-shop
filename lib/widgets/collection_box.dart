import 'package:fashion_store/theme/color.dart';
import 'package:flutter/material.dart';
import 'custom_image.dart';

class CollectionBox extends StatelessWidget {
  CollectionBox({ Key? key, required this.data, this.isCardBox = true}) : super(key: key);
  final data;
  final bool isCardBox;

  @override
  Widget build(BuildContext context) {
    return isCardBox ?
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primary,
                ),
                shape: BoxShape.circle
              ),  
              child: CustomImage(
                data["image"],
                width: 65, height: 65,
              ),
            ),
            SizedBox(height: 10,),
            Text(data["title"], maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        ),
      )
      :
      Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primary,
                ),
                shape: BoxShape.circle
              ),  
              child: CustomImage(
                data["image"],
                width: 65, height: 65,
              ),
            ),
            SizedBox(height: 10,),
            Text(data["title"], maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        ),
      )
      ;
  }
}
