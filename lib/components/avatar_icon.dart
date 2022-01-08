import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget{
  Icon icon;
  Color color;
  AvatarIcon({Key? key, required this.icon,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CircleAvatar(
      backgroundColor: color,
      maxRadius: 20.0,
      minRadius: 20,
      child: CircleAvatar(
        backgroundColor: Colors.white   ,
        child: icon,
        maxRadius: 19.0,
        minRadius: 16.0,
      ),

    );
  }

}