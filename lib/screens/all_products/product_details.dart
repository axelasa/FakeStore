import 'package:fake_store/bloc/get_product_details_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetails extends StatefulWidget {

  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  // @override
  // void initState() {
  //   super.initState();
    //api endpoint

    //method receiving data from previous page
     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     //   int product = ModalRoute.of(context)!.settings.arguments as int;
     //   BlocProvider.of<GetProductDetailsBloc>(context).add(GetProductDetailsInfo(product));
     // });

  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        left:true,
        right:true,
        top:true,
        bottom:true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
               padding: const EdgeInsets.only(top: 5.0),
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: BlocConsumer<GetProductDetailsBloc,GetProductDetailsState>(
                listener: (context,state){
                  if(state is GetProductDetailsSuccess){
                    if (kDebugMode) {
                      print('Data retrieved successfully');
                    }
                  }
                },
                builder: (context,state){
                  if(state is GetProductDetailsLoading){
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if(state is GetProductDetailsFail){
                    return Center(
                      child: Text(
                        state.error.toString(),
                        style: const TextStyle(
                          color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500
                        ),
                      ),
                    );
                  }
                  if(state is GetProductDetailsSuccess){
                    return Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: NetworkImage('${state.data?.image}'),
                             height: 260,
                          ),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                      '${state.data?.title}'
                                  ),
                                  subtitle: Text(
                                      'KES: ${state.data?.price}\n ${state.data?.category}\n ⭐️${state.data?.rating?.rate}'
                                  ),
                                ),
                                ListTile(
                                  subtitle: Text(
                                    '${state.data?.description}'
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
