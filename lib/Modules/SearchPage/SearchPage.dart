import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/Components/components.dart';
import 'package:news/Shared/Cubit/news_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  NewsCubit.get(context).GetSearch(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefix: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) =>
                        ListItem(context, list[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                          color: Colors.grey[200],
                          height: 3,
                          width: double.infinity,
                        ),
                    itemCount: list.length),
              )
            ],
          ),
        );
      },
    );
  }
}
