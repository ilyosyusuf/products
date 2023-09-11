import 'package:dio/dio.dart';

class ProductsService {
  final Dio dio = Dio();

  Future getProductsData() async {
    final response = await dio.get('https://fakestoreapi.com/products/');
    return response.data;
  }

  Future<Map<String, dynamic>> getProductDetails({required int id}) async {
    final response = await dio.get('https://fakestoreapi.com/products/$id');
    return response.data;
  }
}