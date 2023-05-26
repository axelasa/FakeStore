import 'package:fake_store/bloc/get_product_details_bloc.dart';
import 'package:fake_store/bloc/get_products_in_specific_category_bloc.dart';
import 'package:fake_store/common/simple_bloc_observer.dart';
import 'package:fake_store/di/injection.dart';
import 'package:fake_store/screens/all_products/all_products.dart';
import 'package:fake_store/screens/categories/category.dart';
import 'package:fake_store/screens/all_products/product_details.dart';
import 'package:fake_store/screens/categories/product_category.dart';
import 'package:fake_store/screens/sort/limit_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/get_all_categories_bloc.dart';
import 'bloc/get_all_products_bloc.dart';
import 'bloc/get_limited_results_bloc.dart';

void main() {
  setUp();
  runApp(const MyApp());

  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<GetAllProductsBloc>(),
        ),
        BlocProvider(
            create: (context) => getIt.get<GetProductDetailsBloc>()
        ),
        BlocProvider(
            create: (context) => getIt.get<GetAllCategoriesBloc>()
        ),
        BlocProvider(
            create: (context) => getIt.get<GetProductsInSpecificCategoryBloc>()
        ),
        BlocProvider(
            create: (context) => getIt.get<GetLimitedResultsBloc>()
        ),
      ],
      child: MaterialApp(
       home: const AllProducts(),
        routes: {
          '/product_details':(context) => const ProductDetails(),
          '/category': (context) => const GetAllCategories(),
          '/product_category' : (context) => const ProductCategory(),
          '/limit_result' :(context) => const LimitResults()
        },
      ),
    );
 }
}
