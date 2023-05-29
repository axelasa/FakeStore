import 'package:fake_store/bloc/get_all_cart_bloc.dart';
import 'package:fake_store/model/products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartPage extends StatefulWidget {
  const GetCartPage({Key? key}) : super(key: key);

  @override
  State<GetCartPage> createState() => _GetCartPageState();
}

class _GetCartPageState extends State<GetCartPage> {
@override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCartBloc>(context).add(GetAllCartInfo());
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: BlocConsumer<GetAllCartBloc,GetAllCartState>(
          listener: (context,state){
          if(state is GetAllCartSuccess){
            if (kDebugMode) {
              print("Here is the Data on Carts");
            }}
        },
          builder: (context,state){
            if (state is GetAllCartLoading){
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if(state is GetAllCartFail){
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(
                    fontSize: 15,fontWeight: FontWeight.w600,color: Colors.red,
                  ),
                ),
              );
            }
            if(state is GetAllCartSuccess) {
              List<GetCart?> response = state.data;
              if (kDebugMode) {
                print(response.length);
              }
              return Column(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.length,
                        itemBuilder: (context, i){
                        GetCart? cart = response[i];
                        List<Product>? products = cart?.products;
                        return ProductsListPage(products: products,);
                        },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}


class ProductsListPage extends StatelessWidget {
  const ProductsListPage({this.products, Key? key}) : super(key: key);

  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    if(products == null) return const Text("No products in cart");

    return ListView.builder(
      shrinkWrap: true,
      itemCount: products!.length,
      itemBuilder: (context, i){
        Product product = products![i];
        return ProductItem(product: product);
      },
    );
  }
}


class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey, child: Text(product.productId.toString()));
  }
}
