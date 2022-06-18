import 'package:flutter/material.dart';

class PhotoItemCard extends StatelessWidget {
 final String imgUrl;

  const PhotoItemCard({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imgUrl,
          ),
        ),
      ),
    );
  }
}
