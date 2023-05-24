
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store/model/products.dart';
import 'package:flutter/foundation.dart';

import '../network_call/api_call.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  final GetAllProductsRepo getAllProductsRepo;

  GetAllProductsBloc(this.getAllProductsRepo) : super(GetAllProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async{
      try{
        emit(const GetAllProductsLoading());
        final List<Products> model = await getAllProductsRepo.getAllProducts();
        if (kDebugMode) {
          print(model);
        }
        emit(GetAllProductsSuccess(model));
      }catch(e){
        emit(GetAllProductsFail(e.toString()));
      }
    });
  }
}
