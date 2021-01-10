import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Controller/Services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:bang/View/Profile.dart';
import 'package:provider/provider.dart';
import 'package:bang/Controller/Database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bang/View/Widgets.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  getData() async{
    List<CharacterProfile> data = await Provider.of<Popular>(context).getPopular();
    Provider.of<Popular>(context, listen: false).setPopHero(data);
  }
  getVil() async{
    List<CharacterProfile> popVil = await Provider.of<Villains>(context).getPopular();
    Provider.of<Villains>(context, listen: false).setPopVil(popVil);
  }

  final curpage = ValueNotifier<int>(0);
  bool isloading = true;
  List<CharacterProfile> popHeroes = new List<CharacterProfile>();
  List<CharacterProfile> randHeroes = new List<CharacterProfile>();
  List<CharacterProfile> popVil = new List<CharacterProfile>();

  getList() async {
    RandomHeroes randomHeroes = new RandomHeroes();
    await randomHeroes.getRandom();
    randHeroes = randomHeroes.randomHeroes;
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
    getVil();
    getData();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: null, child: Icon(Icons.search, color: Colors.white,),backgroundColor: Colors.grey[400],),
        backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            title:Text("Bang", style: TextStyle(letterSpacing: 5, fontSize: 30, color: Colors.grey[400]),),
            backgroundColor:Colors.white,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5,),
                Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Explore", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey[400], letterSpacing: 5),textAlign: TextAlign.start,),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Text("More Characters", style: TextStyle(fontSize: 16, color: Colors.grey[400], letterSpacing: 5),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Container(
                          child: isloading
                              ? Container(
                            child: CircularProgressIndicator(),
                          )
                              : Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            ),
                            child: Swiper(itemCount:randHeroes.length,
                            autoplay: true,
                            loop: true,
                            pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                space: 10,
                                activeColor: Colors.grey[400],

                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            //pagination:DotSwiperPaginationBuilder() ,
                            layout: SwiperLayout.DEFAULT,
                                itemBuilder: (context, index) {
                                  return randomHeroesWidget(randHeroes[index]);
                                })
                            /*CarouselSlider.builder(itemBuilder: (context, index) {
                              return randomChar(
                                  randHeroes[index]
                              );
                            },itemCount: randHeroes.length,
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height*0.45,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              pageSnapping: true,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: hello,
                            ),),*/
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Popular Heroes", style: TextStyle(fontSize: 20, color: Colors.grey[400], fontWeight: FontWeight.bold, letterSpacing: 5),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 150,
                        child: Provider.of<Popular>(context).popHeroes.length == null ? Container(
                          child: CircularProgressIndicator(),
                        ) : ListView.builder(itemBuilder: (BuildContext context, index){
                          return popheroes(Provider.of<Popular>(context).popHeroes[index]);
                        },
                          itemCount: Provider.of<Popular>(context).popHeroes.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(right: 8),
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Popular Villains", style: TextStyle(fontSize: 20, letterSpacing: 5,color: Colors.grey[400], fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: 150,
                        child: ListView.builder(itemBuilder: (BuildContext context, index){
                          return popheroes(
                              Provider.of<Villains>(context).popularVil[index]
                          );
                        },
                          itemCount: Provider.of<Villains>(context).popularVil.length,
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
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
          return new Profile(characterProfile);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          child:Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(characterProfile.biography.publisher, style:TextStyle(fontSize: 20,)),
                  Text(characterProfile.name, style:TextStyle(fontSize: 16,))
                ],
              ),
              Card(child: Image.network(characterProfile.image.url,fit:BoxFit.cover,),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                clipBehavior: Clip.hardEdge,
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget popheroes(CharacterProfile characterProfile){
    return GestureDetector(
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
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, 1),
                  blurRadius: 5.0,
                  //offset: Offset(0, 10)
                )
              ]
          ),

          child: Column(
            children: <Widget>[
              Container(
                child: Card(child: Image.network(characterProfile.image.url, fit: BoxFit.cover,),
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
                child: Text(characterProfile.name, style: TextStyle(fontSize: 10, color: Colors.grey[400], fontWeight: FontWeight.bold, letterSpacing: 3),),
              )
            ],
          ),
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
