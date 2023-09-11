import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/screens/bloc/products_bloc.dart';
import 'package:products/services/products_service.dart';

class ProductDetailsPage extends StatefulWidget {
  int id;
  ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final bloc = ProductsBloc(ProductsService());

  @override
  void initState() {
    super.initState();
    bloc.add(GetProductDetailsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ProductsIdLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductsIdSuccessState) {
              return Center(
                child: Text(state.productDetailsModel.price.toString()),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
