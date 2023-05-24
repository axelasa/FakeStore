import 'package:fake_store/bloc/get_all_categories_bloc.dart';
import 'package:fake_store/bloc/get_all_products_bloc.dart';
import 'package:fake_store/bloc/get_product_details_bloc.dart';
import 'package:fake_store/network_call/api_call.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<GetAllProductsBloc>(
      () => GetAllProductsBloc(GetAllProductsRepo()));
  getIt.registerLazySingleton(() => GetProductDetailsBloc());
  getIt.registerLazySingleton(() => GetAllCategoriesBloc());
}
