part of 'products_bloc.dart';


abstract class ProductsEvent {
  get id => null;
}

class GetProductsEvent extends ProductsEvent{}

class GetProductDetailsEvent extends ProductsEvent{
  int id;

  GetProductDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

