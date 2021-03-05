import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Presentation/Screens/Profile.dart';
import 'package:flutter/material.dart';

Widget randomHeroesWidget(CharacterProfile characterProfile, BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
        return new Profile(characterProfile);
      }));
    },
    child: Container(
      child: AspectRatio(
          aspectRatio: 2,
          child: FadeInImage(
            image: NetworkImage(characterProfile.image.url),
            fit: BoxFit.cover,
            placeholder: AssetImage("asset/images/escanor.png"),
          )),
    ),
  );
}
