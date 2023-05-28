import 'package:fake_store/bloc/get_all_cart_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCart extends StatefulWidget {
  const GetCart({Key? key}) : super(key: key);

  @override
  State<GetCart> createState() => _GetCartState();
}

class _GetCartState extends State<GetCart> {
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
            if(state is GetAllCartSuccess){
              var response = state.data;
              if (kDebugMode) {
                print(response.length);
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: response.length,
                        itemBuilder: (context, i){
                        SizedBox(
                          width: double.infinity,
                          height: 500,
                          child:Text(
                            'HERE IS THE RESPONSE${response[i]?.userId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                        if (kDebugMode) {
                          print('HERE IS THE RESPONSE ${response[i]?.userId}');
                        }
                        return null;
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
