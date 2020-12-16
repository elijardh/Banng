import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Controller/Services.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isloading = true;
  List<CharacterProfile> popHeroes = new List<CharacterProfile>();

  getList() async {
    Popular pop = new Popular();
    await pop.getPopular();
    popHeroes = pop.popularHeroes;
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Container(
              child: TextField(
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(),
                  hintText: "Search",
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Popular Heroes"),
                  Container(
                      child: isloading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                        height: 100,
                            child: ListView.builder(itemBuilder: (context, index) {
                              return popheroes(
                                //popHeroes[index].image.url,
                                popHeroes[index].name
                              );
                      },scrollDirection: Axis.horizontal,),
                          ))
                ],
              ),
            ),
          )),
    );
  }

  Widget popheroes(String charactername){
    return Container(
      child: Stack(
        children: <Widget>[
          //Image.network(imageurl),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(charactername),
          )
        ],
      ),
    );
  }
}
