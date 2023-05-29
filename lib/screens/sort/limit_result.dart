import 'package:fake_store/bloc/get_limited_results_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../bloc/get_product_details_bloc.dart';
import '../categories/category.dart';

class LimitResults extends StatefulWidget {
  const LimitResults({Key? key}) : super(key: key);

  @override
  State<LimitResults> createState() => _LimitResultsState();
}

class _LimitResultsState extends State<LimitResults> {

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero,(){
  //     int selectedItem = ModalRoute.of(context)!.settings.arguments as int;
  //     BlocProvider.of<GetLimitedResultsBloc>(context).add(GetLimitedResultsInfo(selectedItem));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
                Icons.arrow_back_sharp
            ),
          ),
          ),
          const Expanded(
              flex: 1,
              child: GetAllCategories()),
          Expanded(
            flex:12,
            child:Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: BlocConsumer<GetLimitedResultsBloc, GetLimitedResultsState>(
                  listener: (context, state) {
                    if (state is GetLimitedResultsSuccess) {
                      if (kDebugMode) {
                        print("Data Has Been Retrieved");
                      }
                    }
                  }, builder: (context, state) {
                if (state is GetLimitedResultsLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is GetLimitedResultsFail) {
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
                if (state is GetLimitedResultsSuccess) {
                  List response = state.data;
                  if (kDebugMode) {
                    print(response);
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
                                Navigator.pushNamed(context,"/product_details",);
                              },
                              child: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text('KES ${response[i].price.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,color: Colors.white
                                  ),
                                ),
                                subtitle: Text(
                                  '${response[i].rating?.count} available  '
                                      '⭐️${response[i].rating?.rate} \n ${response[i].title}',
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
                                child: SizedBox(
                                  height: 300,
                                  width: 120,
                                  child:Padding(
                                    padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
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
      ),
    );
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