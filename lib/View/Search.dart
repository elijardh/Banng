import 'package:bang/utils/size_config.dart';
import 'package:bang/widgets/texts.dart';
import 'package:bang/widgets/y_margin.dart';
import 'package:flutter/material.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bang/Controller/Services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:bang/View/Profile.dart';
import 'package:provider/provider.dart';
import 'package:bang/Controller/Database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bang/View/Widgets.dart';
import 'package:bloc/bloc.dart';

import 'ViewModel/LandingPageViewModel/random_bloc.dart';
import 'ViewModel/PopularHeroesViewModel/popular_heroes_bloc.dart';
import 'package:bang/View/ViewModel/PopularVillainViewModel/popular_villain_bloc.dart';

import 'ViewModel/SearchViewModel/search_bloc.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          width: SizeConfig.screenWidthDp,
          height: SizeConfig.screenHeightDp,
          child: BlocBuilder(
            bloc: _searchBloc,
            builder: (BuildContext context, SearchState state) {
              if (state is SearchInitial) {
                return Container(
                    child: Column(children: [
                      YMargin(50),
                      Container(
                        height: config.sh(40),
                        width: config.sw(300),
                        color: Colors.white,
                        child: TextField(
                          controller: _searchController,
                          onSubmitted: (value){
                            _searchBloc.dispatch(Search(_searchController.value.text));
                          },
                        ),
                      ),
                    ]
                    )
                );
              }
              else if(state is SearchLoading){
                return Container(
                    child: Column(children: [
                      YMargin(50),
                      Container(
                        height: config.sh(40),
                        width: config.sw(300),
                        color: Colors.white,
                        child: TextField(
                          controller: _searchController,
                          onSubmitted: (value){
                            _searchBloc.dispatch(Search(_searchController.value.text));
                          },
                        ),
                      ),
                      YMargin(50),
                      Image.asset("asset/images/loading.gif"),
                    ]
                    )
                );
              }
              else if( state is SearchLoaded){
                return Container(
                    child: Column(children: [
                      YMargin(50),
                      Container(
                        height: config.sh(40),
                        width: config.sw(300),
                        color: Colors.white,
                        child: TextField(
                          controller: _searchController,
                          onSubmitted: (value){
                            _searchBloc.dispatch(Search(_searchController.value.text));
                          },
                        ),
                      ),
                      YMargin(50),
                      Container(
                        height: config.sh(500),
                        child: ListView.builder(itemBuilder: (BuildContext context, index){
                          return Text(state.characterProfileList.results[index].name);
                        },
                        itemCount: state.characterProfileList.results.length,),
                      )
                    ]
                    )
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
    );
  }
}
