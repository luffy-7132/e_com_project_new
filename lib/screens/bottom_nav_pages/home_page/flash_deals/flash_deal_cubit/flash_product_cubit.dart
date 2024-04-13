import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/flash_products_model.dart';

class ImageCarouselCubit extends Cubit<List<FlashProductsModel>> {
  ImageCarouselCubit() : super([]);

  Future<void> fetchImages() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.infusevalue.live/api/v1/flash-deals/products/2'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<FlashProductsModel> products = data
            .map<FlashProductsModel>(
                (item) => FlashProductsModel.fromJson(item))
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
