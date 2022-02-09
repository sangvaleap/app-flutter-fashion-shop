import 'package:fashion_store/theme/color.dart';
import 'package:fashion_store/widgets/custom_image.dart';
import 'package:fashion_store/widgets/favorite_box.dart';
import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {
  NewItem({ required this.data, Key? key, this.onTap, this.onTapFavorite}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          height: 300,
          child: Stack(
            children: [
              CustomImage(
                data["image"]!, radius: 20,
                width: 200, height: 250,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: FavoriteBox(
                  onTap: onTapFavorite,
                  isFavorited: data["is_favorited"],
                ),
              ),
              Positioned(
                top: 260,
                left: 0,
                child: Container(
                  child: Text(data["price"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: darker),),
                )
              ),
              Positioned(
                top: 280,
                left: 0,
                child: Container(
                  child: Text(data["name"], maxLines: 1, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor),),
                )
              )
            ],
          ),
        ),
      );
  }
}