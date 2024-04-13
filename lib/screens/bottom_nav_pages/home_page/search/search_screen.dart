import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/search/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String baseThumbnailUrl =
    "https://www.infusevalue.live/storage/app/public/product/thumbnail/";

class SearchScreen extends StatefulWidget {
  String productName;

  SearchScreen({super.key, required this.productName});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().getSearchData(widget.productName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchLoadedState) {
            if (state.searchModel.products![0] != null) {
              return Column(
                children: [
                  Text(state.searchModel.products![0].name.toString()),
                  Image.network(
                      "$baseThumbnailUrl${state.searchModel.products![0].thumbnail.toString()}")
                ],
              );
            } else {
              return const Center(
                child: Text('Please Search For Valid Product....'),
              );
            }
          } else {
            return const Center(
              child: Text('Please Search For Valid Product....'),
            );
          }
        },
      ),
    );
  }
}
