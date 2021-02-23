import 'package:bang/utils/size_config.dart';
import 'package:bang/widgets/texts.dart';
import 'package:bang/widgets/y_margin.dart';
import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';

class Profile extends StatefulWidget {
  final CharacterProfile characterProfile;
  Profile(this.characterProfile);
  @override
  _ProfileState createState() => _ProfileState(characterProfile);
}

class _ProfileState extends State<Profile> {
  final CharacterProfile characterProfile;
  _ProfileState(this.characterProfile);
  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: SizeConfig.screenHeightDp,
          width: SizeConfig.screenWidthDp,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(characterProfile.image.url),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7),
              BlendMode.darken),
              onError: (exception, stackTrace) => Image.asset("asset/images/escanor.png"),

            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                child: Icon(Icons.more_vert),
                alignment: Alignment.topLeft,
              ),
              Container(
                child: Card(child: Image.network(characterProfile.image.url,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Image.asset("asset/images/escanor.png"),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                clipBehavior: Clip.hardEdge,),
                height: config.sh(200),
                width: config.sw(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  //color: Colors.black.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2.0,
                    )
                  ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(child: Center(child: Text(characterProfile.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),)),decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2.0,
                    )
                  ],
                borderRadius: BorderRadius.circular(20)
              ),
              height: 30,
              width: 200,),
              SizedBox(
                height: 10,
              ),
              Container(child: Center(child: Text(characterProfile.biography.fullname, style: TextStyle(fontSize: 13,fontWeight:FontWeight.bold, color: Colors.black.withOpacity(0.8)),)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0,
                    )
                  ],
                borderRadius: BorderRadius.circular(20)
              ),
              width: 160,
              height: 30,),
              SizedBox(
                height:10
              ),
              Container(
                child:Center(child: Text(characterProfile.biography.publisher, style: TextStyle(color: Colors.black.withOpacity(0.8)),)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1.0,
                      )
                    ],
                  borderRadius: BorderRadius.circular(20)
                ),
                height: config.sh(20),
                width: config.sw(100),
              ),
              YMargin(50),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 60,
                width: 400,
                decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      )
                    ],
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Intelligence", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.intelligence, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8),),),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text("strength", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.strength, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),)),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text("speed", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.speed,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),)),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text("durability", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.durability, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),)),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text("power", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.power, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),)),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|", style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text("combat", style: TextStyle(color: Colors.black.withOpacity(0.8),),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(characterProfile.powerstats.combat, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8),)),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
