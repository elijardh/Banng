import 'package:bang/Model/CharacterProfile.dart';
import 'package:flutter/material.dart';

Widget randomHeroesWidget(CharacterProfile characterProfile){
  return Container(
/*    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(characterProfile.image.url),
        fit: BoxFit.fill,
      )
    ),*/
    child: AspectRatio(aspectRatio: 2,
        child: FadeInImage(

          image: NetworkImage(characterProfile.image.url),fit: BoxFit.cover,placeholder: AssetImage("asset/images/escanor.png"),)),
  );
}