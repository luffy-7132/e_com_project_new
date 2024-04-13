import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/special_for_you_model.dart';

class SpecialForYouCubit extends Cubit<List<Products>> {
  SpecialForYouCubit() : super([]);

  Future<void> fetchImages() async {
    try {
      var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.infusevalue.live/api/v1/products/featured?limit=4&offset=1'),
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        final specialForYouModel = SpecialForYouModel.fromJson(data);
        emit(specialForYouModel.products!); // Emit loaded products
      } else {
        print('Failed to load images: ${response.statusCode}');
        throw Exception('Failed to load images: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching images: $e');
      throw Exception('Failed to load images: $e');
    }
  }
}
