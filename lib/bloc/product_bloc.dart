import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../network_call/api_call.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInfo>(_onProductEvent);
  }

  FutureOr<void> _onProductEvent(ProductInfo event, Emitter<ProductState> emit) async{
    try{
      emit(const ProductLoading());
      final model = await getProduct();
      emit(ProductSuccess(model));

    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ProductFail(e.toString()));
    }
  }
}
