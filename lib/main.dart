import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/BlocObserver.dart';
import 'package:news/Shared/Cubit/news_cubit.dart';
import 'package:news/Shared/RemoteNetwork/Dio_Helper.dart';
import 'package:news/layout/News_Layout.dart';

void main() {
  dioHelper.inite();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => NewsCubit()..GetBusiness()..GetScience()..GetAllNews()..GetSports(),
      child: BlocConsumer<NewsCubit,NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsLayout(),
      );
  },
),
    );
  }
}

