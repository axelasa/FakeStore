import 'package:fake_store/bloc/get_all_categories_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/get_products_in_specific_category_bloc.dart';

class GetAllCategories extends StatefulWidget {
  const GetAllCategories({Key? key}) : super(key: key);

  @override
  State<GetAllCategories> createState() => _GetAllCategoriesState();
}

class _GetAllCategoriesState extends State<GetAllCategories> {

  @override
  void initState() {
    BlocProvider.of<GetAllCategoriesBloc>(context).add(GetAllCategoriesInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true ,
        right: true ,
        left: true ,
        bottom: true ,

        child: Center(
          child: BlocConsumer<GetAllCategoriesBloc,GetAllCategoriesState>(
              listener: (context, state){
                if(state is GetAllCategoriesSuccess){
                  if (kDebugMode) {
                    print('Data Has Been Retrieved Successfully');
                  }
                }
              },
            builder: (context,state){
                if(state is GetAllCategoriesLoading){
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if(state is GetAllCategoriesFail){
                  return Center(
                    child:Text(
                      state.error.toString()
                    )
                  );
                }
                if(state is GetAllCategoriesSuccess){
                  var response = state.data;
                  print(response?.categories?.length);
                  return Flex(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: Axis.horizontal,
                    children: response!.categories!.map((e) =>  Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        child:Text(e),
                        onPressed: () {
                          BlocProvider.of<GetProductsInSpecificCategoryBloc>(context).add(GetProDuctsInSpecificCategoryInfo(e));
                          Navigator.pushNamed(context, '/product_category');
                        },
                      ),
                    )).toList()
                  );
                }
                return const SizedBox.shrink();
              },
          ),
        ),
      ),
    );
  }
}
