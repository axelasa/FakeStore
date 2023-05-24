import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../model/products.dart';
import '../network_call/api_call.dart';

part 'get_product_details_event.dart';
part 'get_product_details_state.dart';

class GetProductDetailsBloc extends Bloc<GetProductDetailsEvent, GetProductDetailsState> {

  GetProductDetailsBloc() : super(GetProductDetailsInitial()) {
    on<GetProductDetailsInfo>(_onGetProductDetailsEvent);
  }

  Future<void> _onGetProductDetailsEvent(GetProductDetailsInfo event, Emitter<GetProductDetailsState> emit) async {
    try{
      emit(const GetProductDetailsLoading());
      final model =await getSingleProduct(event.id);
      if (kDebugMode) {
        print(model?.title);
      }
      emit(GetProductDetailsSuccess(model));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(GetProductDetailsFail(e.toString()));
    }
  }
}
