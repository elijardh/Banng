import 'package:bang/Controller/Database.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Presentation/Screens/Profile.dart';
import 'package:flutter/material.dart';

Widget popChar(CharacterProfile characterProfile, BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0),
    child: GestureDetector(
      onLongPress: (){
/*        var hell = _databaseProvider.getItAll();
          print(hell);*/
      },
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
          return new Profile(characterProfile);
        }));
      },
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 3.0,
                  //offset: Offset(0, 10)
                )
              ]
          ),

          child: Column(
            children: <Widget>[
              Container(
                child: Card(child: FadeInImage(
                    fit: BoxFit.fill,
                    imageErrorBuilder: (context, error, stackTrace) => Image.asset("asset/images/escanor.png"),
                    placeholder: AssetImage("asset/images/escanor.png"),
                    image: NetworkImage(characterProfile.image.url,)
                ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                  clipBehavior: Clip.hardEdge,),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async{
                  DatabaseProvider.instance.save(characterProfile);
                },
                child:Text(characterProfile.name, style: TextStyle(fontSize: 6, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold, letterSpacing: 3,wordSpacing: 1,),),
              )
            ],
          ),
        ),
      ),
    ),
  );
}