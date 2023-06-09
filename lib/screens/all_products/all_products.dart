import 'package:fake_store/bloc/get_all_products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:mplatform/mplatform.dart';

import '../../bloc/get_limited_results_bloc.dart';
import '../../bloc/get_product_details_bloc.dart';
import '../categories/category.dart';
import '../profile/profile.dart';

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

  List<dynamic> limit = [
    0,
    1,
    5,
    15,
    20,
  ];
  dynamic selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    var smallScreen = MediaQuery.of(context).size.aspectRatio <= 16.9;
    var bigScreen = MediaQuery.of(context).size.height >= 17.0;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: smallScreen ? 3 : 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: Profile()),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButton(
                            value: selectedItem,
                            items: limit
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      '$e',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (e) => setState(() {
                              selectedItem = e;
                              if (kDebugMode) {
                                print("$selectedItem Has been tapped");
                              }
                              if (selectedItem == 0) {
                                return;
                              } else {
                                BlocProvider.of<GetLimitedResultsBloc>(context)
                                    .add(GetLimitedResultsInfo(selectedItem));
                                Navigator.pushNamed(context, "/limit_result",
                                    arguments: selectedItem);
                              }
                            }),
                            icon: const Icon(
                                CupertinoIcons.arrow_down_right_arrow_up_left),
                            onTap: () {
                              if (kDebugMode) {
                                print("$selectedItem Has been tapped");
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(flex: 2, child: GetAllCategories()),
              Expanded(
                flex: 16,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1),
                          itemCount: response.length,
                          itemBuilder: (_, i) {
                            return GridTile(
                              footer: Material(
                                color: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(4))),
                                clipBehavior: Clip.antiAlias,
                                child: GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print('I have been tapped');
                                    }
                                    BlocProvider.of<GetProductDetailsBloc>(
                                            context)
                                        .add(GetProductDetailsInfo(
                                            response[i].id));
                                    //Navigator.pushNamed(context, "/product_details":arguments: response[i].id);
                                    Navigator.pushNamed(
                                      context,
                                      "/product_details",
                                    );
                                  },
                                  child: GridTileBar(
                                    backgroundColor: Colors.black45,
                                    title: Text(
                                      'KES ${response[i].price.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      '${response[i].rating?.count} available  '
                                      '⭐️${response[i].rating?.rate} \n ${response[i].title}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      // height: 300,
                                      // width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, bottom: 12.0),
                                        child: ProductImage(
                                          url:  response[i].image.toString(),
                                          onTap: () {
                                            if (kDebugMode) {
                                              print('I image have been Tapped');
                                            }
                                            BlocProvider.of<
                                                        GetProductDetailsBloc>(
                                                    context)
                                                .add(GetProductDetailsInfo(
                                                    response[i].id));
                                            Navigator.pushNamed(
                                              context,
                                              "/product_details",
                                            );
                                          },
                                        ),
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
        ));
  }
}

class ProductImage extends StatelessWidget {

  ProductImage({
    this.url,
    this.height = 300,
    this.width = 250,
    this.onTap,
    super.key,
  });

  final String? url;
  final double? height;
  final double? width;
  final BoxFitWeb webBoxFit = BoxFitWeb.scaleDown;
  BoxFit boxFit = BoxFit.contain;
  final BoxFit android = BoxFit.contain;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: url == null
              ? GestureDetector(
                  onTap: onTap,
                  child: Image.asset(
                    "assets/no_image.jpeg",
                    fit: boxFit,
                    height: height,
                    width: width,
                  ),
                )
              : ImageNetwork(
                  image: url!,
                  fitWeb: webBoxFit,
                  height: height!,
                  width: width!,
                  fitAndroidIos: android,
                  onTap: onTap,
                ),
        ),
      ],
    );
  }
}
