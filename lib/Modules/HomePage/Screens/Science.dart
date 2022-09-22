import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/Components/components.dart';
import 'package:news/Shared/Cubit/news_cubit.dart';

class Science extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list= NewsCubit.get(context).science;
        return Expanded(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  ListItem(context,list[index]),
              separatorBuilder: (BuildContext context, int index) => Container(
                color: Colors.grey[200],
                height: 3,
                width: double.infinity,
              ),
              itemCount: list.length),
        );
      },
    )
    ;
  }
}
