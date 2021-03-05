import 'package:bang/Presentation/ViewModel/LandingPageViewModel/random_bloc.dart';
import 'package:bang/Presentation/ViewModel/PopularHeroesViewModel/popular_heroes_bloc.dart';
import 'package:bang/Presentation/ViewModel/PopularVillainViewModel/popular_villain_bloc.dart';
import 'package:bang/Presentation/Views/PopHeroView.dart';
import 'package:bang/Presentation/Views/RandomHeroView.dart';
import 'package:bang/utils/size_config.dart';
import 'package:bang/widgets/texts.dart';
import 'package:bang/widgets/y_margin.dart';
import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:bang/Controller/Database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'Profile.dart';
import 'Search.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  RandomBloc _randomBloc = new RandomBloc();
  PopularHeroesBloc _popularHeroesBloc = new PopularHeroesBloc();
  PopularVillainBloc _popularVillainBloc = new PopularVillainBloc();


  final curpage = ValueNotifier<int>(0);
  List<CharacterProfile> popHeroes = new List<CharacterProfile>();
  List<CharacterProfile> randHeroes = new List<CharacterProfile>();
  List<CharacterProfile> popVil = new List<CharacterProfile>();

/*  getList() async {
    RandomHeroes randomHeroes = new RandomHeroes();
    await randomHeroes.getRandom();
    randHeroes = randomHeroes.randomHeroes;
    setState(() {
      isloading = false;
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randomBloc.dispatch(GetRandomChar());
    _popularHeroesBloc.dispatch(GetPopularHeroes());
    _popularVillainBloc.dispatch(GetPopVil());
  }



  dynamic hello(int hey, CarouselPageChangedReason wtf){
    curpage.value = hey;
  }
  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed:(){
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new SearchPage();
      }));
      }, child: Icon(Icons.search, color: Colors.white,),backgroundColor: Colors.grey[400],),
        backgroundColor: Colors.white,
/*          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            title:Text("Bang", style: TextStyle(letterSpacing: 5, fontSize: 30, color: Colors.grey[400]),),
            backgroundColor:Colors.white,
          ),*/
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                //SizedBox(height: 5,),
                Column(
                  children: <Widget>[
/*                    Container(
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
                    ),*/
/*                    SizedBox(
                      height: 5,
                    ),*/
                    Container(
                      child: Container(
                          child: Container(
                            height: config.sh(400),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            ),
                            child: BlocBuilder(
                              bloc: _randomBloc,
                              builder: (BuildContext context, RandomState state){
                                if(state is RandomInitial){
                                  return Container(
                                    child: Center(
                                      child: TitleText(
                                        text: "Waiting for connection....",
                                      )
                                    ),
                                  );
                                }
                                else if(state is RandomLoading){
                                  return Image.asset("asset/images/loading.gif",);
                                }
                                else if(state is RandomLoaded){
                                  return Swiper(itemCount:state.randomList.length,
                                      autoplay: true,
                                      loop: true,

                                      pagination: SwiperPagination(
                                        builder: DotSwiperPaginationBuilder(
                                          space: 10,
                                          activeColor: Colors.white,
                                          activeSize: 10,
                                          size: 5,
                                          color: Colors.black

                                        ),
                                        alignment: Alignment.bottomCenter,
                                      ),
                                      //pagination:DotSwiperPaginationBuilder() ,
                                      layout: SwiperLayout.DEFAULT,
                                      itemBuilder: (context, index) {
                                        return randomHeroesWidget(state.randomList[index], context);
                                      });
                                }
                                else{
                                  return Container(
                                    child: Center(
                                        child: TitleText(
                                          text: "Bad Network....",
                                        )
                                    ),
                                  );
                                }
                              },
                            )
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Popular Heroes", style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold, letterSpacing: 5, fontFamily: "defont"),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 150,
                        width: SizeConfig.screenWidthDp,
                        child: BlocBuilder(
                          bloc: _popularHeroesBloc,
                          builder: (BuildContext context, PopularHeroesState state ){
                            if(state is PopularHeroesInitial){
                              return Container(
                                child: Center(
                                  child: NormalText(
                                    text:"Awaiting Internet"
                                  ),
                                ),
                              );
                            }
                            else if(state is PopularHeroesLoading){
                              return Image.asset("asset/images/loading.gif",);
                            }
                            else if(state is PopularHeroesLoaded){
                              return ListView.builder(itemBuilder: (BuildContext context, index){
                                return popChar(state.heroList[index], context);
                              },
                                itemCount: state.heroList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(right: 8),
                              );
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          },
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Popular Villains", style: TextStyle(fontSize: 20, letterSpacing: 5,color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold, fontFamily: "defont"),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: config.sh(150),
                        width: SizeConfig.screenWidthDp,
                        child: BlocBuilder(
                          bloc: _popularVillainBloc,
                          builder: (BuildContext context, PopularVillainState state) {
                            if(state is PopularVillainInitial){
                              return Container(
                                child: Center(
                                    child: TitleText(
                                      text: "Waiting for connection....",
                                    )
                                ),
                              );
                            }
                            else if(state is PopularVillainLoading){
                              return Image.asset("asset/images/loading.gif");
                            }
                            else if(state is PopularVillainLoaded){
                              return ListView.builder(itemBuilder: (BuildContext context, index){
                                return popChar(state.list[index], context);
                              },
                                itemCount: state.list.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                              );
                            }
                            else{
                              return Container(
                                child: Center(
                                    child: TitleText(
                                      text: "Bad Network....",
                                    )
                                ),
                              );
                            }
                          },
                        )
                    ),
                    YMargin(50),
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
