import 'package:fake_store/bloc/get_all_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    print('Data Has Been Retrieved SuccessFfully');
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
                      flex: 1,
                      child: TextButton(
                        child:Text(e),
                        onPressed: () {  },
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
