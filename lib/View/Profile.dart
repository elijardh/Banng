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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                Align(
                  child: Icon(Icons.more_vert),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  child: Image.network(characterProfile.image.url,fit: BoxFit.cover,),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(child: Center(child: Text(characterProfile.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),decoration: BoxDecoration(
                  color: Color.fromRGBO(203,65,11,1),
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 30,
                width: 200,),
                SizedBox(
                  height: 10,
                ),
                Container(child: Center(child: Text(characterProfile.biography.fullname, style: TextStyle(fontSize: 13,color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(203,65,11,1),
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 160,
                height: 30,),
                SizedBox(
                  height:10
                ),
                Container(
                  child:Center(child: Text(characterProfile.biography.publisher, style: TextStyle(color: Colors.white),)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(203,65,11,1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 20,
                  width: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 60,
                  width: 400,
                  decoration:BoxDecoration(
                    color: Color.fromRGBO(203,65,11,1),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Intelligence", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.intelligence, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
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
                          Text("strength", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.strength, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
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
                          Text("speed", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.speed,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
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
                          Text("durability", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.durability, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
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
                          Text("power", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.power, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
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
                          Text("combat", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(characterProfile.powerstats.combat, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Biography | Appearance", style: TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                              ),
                              child: Icon(Icons.arrow_forward, size: 20,)),
                        ],
                      ),
                      
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(203,65,11,1),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child:Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("More", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Connections | Work", style: TextStyle(fontSize: 14, color: Colors.white),),
                                  ],
                                ),
                                SizedBox(
                                  width: 130,
                                ),
                                Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        //boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 1.0, spreadRadius: 1.0)],
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: Icon(Icons.arrow_forward, size: 20,)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
