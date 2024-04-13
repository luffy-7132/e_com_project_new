import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/search/search_model/search_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Future<void> getSearchData(String name) async {
    emit(SearchLoadingState());
    var url = 'https://www.infusevalue.live/api/v1/products/search?name=$name';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      SearchModel searchModel = SearchModel.fromJson(data);
      emit(SearchLoadedState(searchModel: searchModel));
    } else {
      print(response.statusCode);
    }
  }
}
