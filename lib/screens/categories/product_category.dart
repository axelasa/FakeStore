import 'package:fake_store/bloc/get_products_in_specific_category_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../bloc/get_product_details_bloc.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom:15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                        Icons.arrow_back_sharp
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: BlocConsumer<GetProductsInSpecificCategoryBloc,GetProductsInSpecificCategoryState>
                    ( listener: (context,state){
                      if(state is GetProDuctsInSpecificCategorySuccess){
                        if (kDebugMode) {
                          print("Data Received SuccessFully");

                        }
                      }
                  },
                    builder: (context,state){
                      if(state is GetProDuctsInSpecificCategoryLoading){
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if(state is GetProDuctsInSpecificCategoryFail){
                        return Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,fontSize: 15,color: Colors.red
                            ),
                          ),
                        );
                      }
                      if(state is GetProDuctsInSpecificCategorySuccess){
                        List response = state.data;
                        if (kDebugMode) {
                          print('Here is the Response $response');
                        }
                        return Container(
                          width: double.infinity,
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
                                      backgroundColor: Colors.black45,
                                      title: Text('KES ${response[i]?.price.toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,color: Colors.white
                                        ),

                                      ),
                                      subtitle: Text(
                                          '${response[i]?.rating?.count} available '
                                              '⭐️ ${response[i]?.rating?.rate} \n ${response[i]?.title}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
                                        child: ImageNetwork(
                                          image: response[i].image.toString(),
                                          fitWeb: BoxFitWeb.cover,
                                          height: 300,
                                          width: 150,
                                          fitAndroidIos: BoxFit.fill,
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
                    },
                  )
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
