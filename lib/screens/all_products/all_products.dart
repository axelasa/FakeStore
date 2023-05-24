import 'package:fake_store/bloc/get_all_products_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../bloc/get_product_details_bloc.dart';
import 'category.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllProductsBloc>(context).add(GetAllProductsInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          right: true,
          left: true,
          bottom: true,
          child: Flex(
            
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                  child: const GetAllCategories()),
              Expanded(
                flex: 5,
                  child:Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: BlocConsumer<GetAllProductsBloc, GetAllProductsState>(
                        listener: (context, state) {
                          if (state is GetAllProductsSuccess) {
                            if (kDebugMode) {
                              print("Data Has Been Retrieved");
                            }
                          }
                        }, builder: (context, state) {
                      if (state is GetAllProductsLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state is GetAllProductsFail) {
                        return Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      }
                      if (state is GetAllProductsSuccess) {
                        List response = state.data;
                        if (kDebugMode) {
                          print(response);
                        }
                        return Container(
                          width: double.infinity,
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1),
                            itemCount: response.length,
                            itemBuilder: (_, i) {
                              return GridTile(
                                footer: Material(
                                  color: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.vertical(top: Radius.circular(4))
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: GestureDetector(
                                    onTap: (){
                                      if (kDebugMode) {
                                        print('I have been tapped');
                                      }
                                      BlocProvider.of<GetProductDetailsBloc>(context).add(GetProductDetailsInfo(response[i].id));
                                      //Navigator.pushNamed(context, "/product_details":arguments: response[i].id);
                                      Navigator.pushNamed(context,"/product_details",);
                                    },
                                    child: GridTileBar(
                                      backgroundColor: Colors.black38,
                                      title: Text('KES ${response[i].price.toString()}'),
                                      subtitle: Text(
                                          '${response[i].rating?.count} available '
                                              '⭐️ ${response[i].rating?.rate} \n ${response[i].title}'),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child:ImageNetwork(
                                          image: response[i].image.toString(),
                                          fitWeb: BoxFitWeb.cover, height: 300, width: 300,
                                          onTap: () {
                                            if (kDebugMode) {
                                              print('I image have been Tapped');
                                            }
                                            BlocProvider.of<GetProductDetailsBloc>(context).add(GetProductDetailsInfo(response[i].id));
                                            Navigator.pushNamed(context,"/product_details",);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  ),
              ),
            ],
          ),
        )
    );
  }
}
