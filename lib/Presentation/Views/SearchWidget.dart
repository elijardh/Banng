import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Presentation/Screens/Profile.dart';
import 'package:bang/utils/size_config.dart';
import 'package:bang/widgets/texts.dart';
import 'package:flutter/material.dart';


Widget searchWidget(CharacterProfile characterProfile, BuildContext context) {
  SizeConfig config = SizeConfig();
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
        return new Profile(characterProfile);
      }));
    },
    child: Stack(
      children: [
        Container(
          height: config.sh(500),
          child: AspectRatio(
              aspectRatio: 2,
              child: FadeInImage(
                image: NetworkImage(characterProfile.image.url),
                fit: BoxFit.cover,
                placeholder: AssetImage("asset/images/escanor.png"),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: NormalText(
            text: characterProfile.name,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
