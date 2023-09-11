import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/screens/bloc/products_bloc.dart';
import 'package:products/screens/pages/product_details_page.dart';
import 'package:products/services/products_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final bloc = ProductsBloc(ProductsService());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductsSuccessState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                id: state.products[index].id),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text("${state.products[index].title.toString()} (${state.products[index].price.toString()})"),
                      ),
                    );
                  }));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
