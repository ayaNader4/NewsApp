import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Modules/HomePage/HomePage.dart';
import 'package:news/Shared/Cubit/news_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var News=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Container(
              child: Row(
                children: [
                  Text(
                    'OXU',
                    style: TextStyle(backgroundColor: Colors.orange),
                  ),
                  Text('.aZ', style: TextStyle(backgroundColor: Colors.black))
                ],
              ),
            ),
          ),
          body: News.Screens[News.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: News.currentIndex,
            onTap: (Index){
              News.ChangeIndex(Index);
            },
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: News.bottomItem,
          ),
        );
      },
    );
  }
}
