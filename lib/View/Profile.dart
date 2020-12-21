import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("BatMan", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
                Text("Bruce", style: TextStyle(fontSize: 16,),),
                SizedBox(
                  height:20
                ),
                Container(
                  child:Text("DC")
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Intelligence"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("10", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text("strength"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("10", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text("speed"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("20",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text("durability"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("20", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text("power"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("20", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text("combat"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("20", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
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
                              Text("Complete Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Biography|Appearance|Connections|Work"),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red
                              ),
                              child: Icon(Icons.arrow_forward, size: 30,)),
                        ],
                      ),
                      
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                                    Text("Complete Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Biography|Appearance|Connections|Work"),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red
                                    ),
                                    child: Icon(Icons.arrow_forward, size: 30,)),
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
