import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store/network_call/api_call.dart';
import 'package:flutter/foundation.dart';

import '../model/products.dart';

part 'get_products_in_specific_category_event.dart';
part 'get_products_in_specific_category_state.dart';

class GetProductsInSpecificCategoryBloc extends Bloc<GetProductsInSpecificCategoryEvent, GetProductsInSpecificCategoryState> {
  GetProductsInSpecificCategoryBloc() : super(GetProductsInSpecificCategoryInitial()) {
    on<GetProDuctsInSpecificCategoryInfo>(_onGetProductsInSpecificCategoryEvent);
  }

  FutureOr<void> _onGetProductsInSpecificCategoryEvent(GetProDuctsInSpecificCategoryInfo event, Emitter<GetProductsInSpecificCategoryState> emit) async{

    try{
      emit(const GetProDuctsInSpecificCategoryLoading());
      final List<Products> model = await getProductsInSpecificCategory(event.category);
      if (kDebugMode) {
        print(model);
      }
      emit(GetProDuctsInSpecificCategorySuccess(model));
    }catch(e){
      GetProDuctsInSpecificCategoryFail(e.toString());
    }
  }
}
