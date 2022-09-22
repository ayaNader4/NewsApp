import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/Modules/HomePage/HomePage.dart';
import 'package:news/Modules/SearchPage/SearchPage.dart';
import 'package:news/Modules/Settings/SettingScreen.dart';
import 'package:news/Modules/savedPage/SavedPage.dart';
import 'package:news/Shared/RemoteNetwork/Dio_Helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<dynamic> AllNews = [];
  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];
  List Screens=[
    HomePage(),
    SearchPage(),
    SavedPage(),
    SettingPage()
  ];
  List<BottomNavigationBarItem> bottomItem=[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.search), label: 'search'),
    BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_outlined), label: 'saved'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'settting'),
  ];
  ChangeIndex(Index) {
    currentIndex = Index;
    emit(NewsbottomNav());
  }
  void GetAllNews() {
    emit(LoadingAllNews());
    if(AllNews.length==0){
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'apiKey': '967528e780c74068ba12005e2725b32b',
      }).then((value) {
        AllNews = value.data['articles'];
        emit(SuccessAllNews());
      }).catchError((error){
        print(error);
        emit(ErrorAllNews(error));
      });
    }
    else
      emit(SuccessAllNews());

  }
  void GetBusiness() {
    emit(LoadingBusiness());
    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category':'business',
      'apiKey': '967528e780c74068ba12005e2725b32b',
    }).then((value) {
      business = value.data['articles'];
      emit(SuccessBusiness());
    }).catchError((error){
      print(error);
      emit(ErrorBusiness(error));
    });
  }
  void GetSports() {
    emit(LoadingSport());
    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category':'sports',
      'apiKey': '967528e780c74068ba12005e2725b32b',
    }).then((value) {
      sports = value.data['articles'];
      emit(SuccessSport());
    }).catchError((error){
      print(error);
      emit(ErrorSport(error));
    });
  }
  void GetScience() {
    emit(LoadingScience());
    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category':'science',
      'apiKey': '967528e780c74068ba12005e2725b32b',
    }).then((value) {
      science = value.data['articles'];
      emit(SuccessScience());
    }).catchError((error){
      print(error);
      emit(ErrorScience(error));
    });
  }
  void GetSearch(value) {
    emit(LoadingSearch());
    dioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '967528e780c74068ba12005e2725b32b',
    }).then((value) {
      search = value.data['articles'];
      emit(SuccessSearch());
    }).catchError((error){
      print(error);
      emit(ErrorSearch(error));
    });
  }
}
