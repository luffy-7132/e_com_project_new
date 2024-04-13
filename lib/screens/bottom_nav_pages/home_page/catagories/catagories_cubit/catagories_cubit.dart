import 'package:bloc/bloc.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/catagories/model/catagories_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatagoriesCubit extends Cubit<List<CatagoriesModel>> {
  CatagoriesCubit() : super([]);

  Future<void> fetchImages() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.infusevalue.live/api/v1/categories'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<CatagoriesModel> products = data
            .map<CatagoriesModel>((item) => CatagoriesModel.fromJson(item))
            .toList();
        emit(products);
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }
}
