import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:products/repositories/product_details.dart';
import 'package:products/repositories/products.dart';
import 'package:products/services/products_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsService productsService;

  ProductsBloc(this.productsService) : super(ProductsInitial()) {
        on<GetProductsEvent>(loadData);
        on<GetProductDetailsEvent>(loadDataWithId);

  }

  loadData(ProductsEvent productsEvent, Emitter emit) async {
    emit(ProductsLoadingState());
    try {
      final productsData = await productsService.getProductsData();
      
      var products = (productsData as List).map((e) => Products.fromJson(e)).toList();

      emit(ProductsSuccessState(products: products));
    } catch (e) {
      print(e);
      emit(ProductsErrorState());
    }
  }


    loadDataWithId(ProductsEvent productIdEvent, Emitter emit) async {
    emit(ProductsIdLoadingState());
    try {
      print("a");
      final productsData = await productsService.getProductDetails(id: productIdEvent.id);
      print("a1");
      var product = ProductDetailsModel.fromJson(productsData);

      print("b");
      emit(ProductsIdSuccessState(productDetailsModel: product));
    } catch (e) {
      print(e);
      emit(ProductsErrorState());
    }
  }
}
