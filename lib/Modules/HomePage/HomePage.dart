import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Modules/HomePage/Screens/All_News.dart';
import 'package:news/Modules/HomePage/Screens/Business.dart';
import 'package:news/Modules/HomePage/Screens/Science.dart';
import 'package:news/Modules/HomePage/Screens/Sports.dart';
import 'package:news/Shared/Components/components.dart';
import 'package:news/Shared/Cubit/news_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var tabController = TabController(length: 4, vsync: this);
        var list= NewsCubit.get(context).AllNews;
        return ConditionalBuilder(condition: list.length>0,
            builder:(context)=>SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: TabBar(
                        isScrollable: true,
                        controller: tabController,
                        indicatorColor: Colors.orange,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        tabs: [
                          Text('All News'),
                          Text("Business"),
                          Text("Science"),
                          Text("Sport")
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: 350,
                child: Carousel(
                  images: [
                    carouselItem(context,list[0]),
                    carouselItem(context,list[1]),
                    carouselItem(context,list[2]),
                    carouselItem(context,list[3]),
                    carouselItem(context,list[4]),
                  ],
                  autoplayDuration: Duration(minutes: 1),
                  dotSize: 5.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.orange,
                  dotIncreasedColor: Colors.grey,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0),
                  borderRadius: true,
                  radius: Radius.circular(30),
                  moveIndicatorFromBottom: 210.0,
                  noRadiusForIndicator: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 600,
                  width: double.infinity,
                  child: TabBarView(

                    controller: tabController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      All_News(),
                      Business(),
                      Science(),
                      Sports(),
                    ],
                  )),
            ],
          ),
        ),
            fallback:(context)=> Center(child: CircularProgressIndicator()));
      },
    );
  }
}
