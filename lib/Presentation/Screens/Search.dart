import 'package:bang/Presentation/ViewModel/SearchViewModel/search_bloc.dart';
import 'package:bang/Presentation/Views/PopHeroView.dart';
import 'package:bang/Presentation/Views/RandomHeroView.dart';
import 'package:bang/Presentation/Views/SearchWidget.dart';
import 'package:bang/utils/size_config.dart';
import 'package:bang/widgets/texts.dart';
import 'package:bang/widgets/y_margin.dart';
import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:search_app_bar/search_app_bar.dart';
import 'package:bang/Controller/Services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:bang/Controller/Database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bloc/bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = new TextEditingController();
  SearchBloc _searchBloc = new SearchBloc();
  SizeConfig config = new SizeConfig();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Colors.black,
                width: 1
              )
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: "Type in a character",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: 3,
                    fontSize: 16,
                  ),

                  suffixIcon: Icon(Icons.search_outlined)
              ),
              cursorColor: Colors.black,
              onSubmitted: (value){
                _searchBloc.dispatch(Search(_searchController.value.text));
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            width: SizeConfig.screenWidthDp,
            height: SizeConfig.screenHeightDp,
            child: BlocBuilder(
              bloc: _searchBloc,
              builder: (BuildContext context, SearchState state) {
                if (state is SearchInitial) {
                  return Container(
                      child: Column(children: [
/*                        YMargin(50),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: config.sh(40),
                          width: config.sw(300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2.0,
                              color: Colors.black,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4.0,
                              )
                            ]
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: "Type in a character",
                                hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3,
                                fontSize: 16,
                              ),

                              suffixIcon: Icon(Icons.search_outlined)
                            ),
                            onSubmitted: (value){
                              _searchBloc.dispatch(Search(_searchController.value.text));
                            },
                          ),
                        ),*/
                      ]
                      )
                  );
                }
                else if(state is SearchLoading){
                  return Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Image.asset("asset/images/loading.gif"),
                      ]
                      )
                  );
                }
                else if( state is SearchLoaded){
                  return Container(

                      height: SizeConfig.screenHeightDp,
                      width: SizeConfig.screenWidthDp,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
/*                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: config.sh(40),
                          width: config.sw(300),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2.0,
                                color: Colors.black,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 4.0,
                                )
                              ]
                          ),
                          child: TextField(
                            controller: _searchController,
                            cursorColor: Colors.black,
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Type in a character",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 3,
                                  fontSize: 16,
                                ),
                                suffixIcon: Icon(Icons.search_outlined)
                            ),
                            onSubmitted: (value){
                              _searchBloc.dispatch(Search(_searchController.value.text));
                            },
                          ),
                        ),*/
                        YMargin(50),
                        Expanded(
                          child:Container(
                            height: SizeConfig.screenHeightDp,
                            width: SizeConfig.screenWidthDp,
                            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                            ), itemBuilder: (BuildContext context, index){
                              if(state.characterProfileList.response == "error"){
                                return Center(
                                  child: Text("Type in a valid hero name"),
                                );
                              }
                              else{
                              return searchWidget(state.characterProfileList.results[index],context);
                              }
                            },
                              itemCount: state.characterProfileList.results.length ?? 1,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,


                            ), /*ListView.builder(itemBuilder: (BuildContext context, index){
                              if(state.characterProfileList.results.isEmpty){
                                return Center(
                                  child: Text("Type in a valid hero name"),
                                );
                              }
                              else{
                              return Container(
                                height: 100,
                                width: 400,
                                child:
                              );
                                // Text(state.characterProfileList.results[index].name);
                              }
                            },
                            itemCount: state.characterProfileList.results.length,),*/
                          ),
                        )
                      ]
                      )
                  );
                }
                else if(state is SearchFailed){
                  return Center(
                    child: Text("Type a goddamn correct character, the devs are unhappy")
                  );
                }
                else{
                  return Container(
                    child:Text("Hello")
                  );
                }
              },
              /*Container(
                child: Column(
                  children: [
                    Container(
                      height: config.sh(40),
                      width: config.sw(300),
                      child: TextField(
                        controller: _searchController,

                      ),
                    )*/
            ),
          ),
        ),
      ),
    );
  }
}
