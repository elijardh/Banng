import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Controller/Services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final curpage = ValueNotifier<int>(0);
  bool isloading = true;
  List<CharacterProfile> popHeroes = new List<CharacterProfile>();
  List<CharacterProfile> randHeroes = new List<CharacterProfile>();
  List<CharacterProfile> popVil = new List<CharacterProfile>();

  getList() async {
    Popular pop = new Popular();
    RandomHeroes randomHeroes = new RandomHeroes();
    Villains vill = new Villains();
    await pop.getPopular();
    await randomHeroes.getRandom();
    await vill.getPopular();
    popVil = vill.popularVil;
    randHeroes = randomHeroes.randomHeroes;
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

  dynamic hello(int hey, CarouselPageChangedReason wtf){
    curpage.value = hey;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: null, child: Icon(Icons.search, color: Colors.white,),backgroundColor: Color.fromRGBO(203,65,11,1),),
        backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Bang"),
            backgroundColor:Color.fromRGBO(203,65,11,1),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top:4),
                              height: 11,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(203,65,11,1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              
                              child: Center(child: Text("Explore", style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                              left: 140,
                              child: pageInd()),
                          Container(
                              child: isloading
                                  ? Center(
                                child: CircularProgressIndicator(),
                              )
                                  : Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.45,
                                child: CarouselSlider.builder(itemBuilder: (context, index) {
                                  return randomChar(
                                      randHeroes[index]
                                  );
                                },itemCount: popHeroes.length,
                                options: CarouselOptions(
                                  height: MediaQuery.of(context).size.height*0.45,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  pageSnapping: true,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: hello,
                                ),),
                              )),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(child: Text("Popular Heroes", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),), padding: EdgeInsets.only(left:10), decoration: BoxDecoration(color: Color.fromRGBO(203,65,11,1),), width: 400,),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 150,
                        child: ListView.builder(itemBuilder: (BuildContext context, index){
                          return popheroes(popHeroes[index]);
                        },
                          itemCount: popHeroes.length,
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        )
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(child: Text("Popular Villains", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),), padding: EdgeInsets.only(left:10), decoration: BoxDecoration(color: Color.fromRGBO(203,65,11,1),), width: 400,),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 150,
                        child: ListView.builder(itemBuilder: (BuildContext context, index){
                          return popheroes(popVil[index]);
                        },
                          itemCount: popVil.length,
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        )
                    ),

                  ],
                ),
              ],
            ),
          )
        )
    );
  }

  Widget randomChar(
      CharacterProfile characterProfile){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.25,
      child:Container(child: Image.network(characterProfile.image.url,fit:BoxFit.cover,), decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),)
    );
  }

  Widget popheroes(CharacterProfile characterProfile){
    return Container(
      height: 150,
      width: 90,
      padding: EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(203,65,11,1),
            borderRadius: BorderRadius.circular(10)
        ),

        padding: EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.network(characterProfile.image.url, fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 15,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(characterProfile.name, style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageInd(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(padding: EdgeInsets.all(10), child: CirclePageIndicator(
        itemCount: randHeroes.length,
        currentPageNotifier: curpage,
      ),),
    );
  }
}
