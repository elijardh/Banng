import 'package:bang/Model/CharacterProfile.dart';
import 'package:flutter/material.dart';

Widget randomHeroesWidget(CharacterProfile characterProfile){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.hardEdge,

    child: AspectRatio(aspectRatio: 2,
        child: Image.network(characterProfile.image.url,fit: BoxFit.cover,gaplessPlayback: true,)),
  );
}