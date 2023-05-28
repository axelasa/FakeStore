import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../model/products.dart';
import '../network_call/api_call.dart';

part 'get_all_cart_event.dart';
part 'get_all_cart_state.dart';

class GetAllCartBloc extends Bloc<GetAllCartEvent, GetAllCartState> {
  GetAllCartBloc() : super(GetAllCartInitial()) {
    on<GetAllCartInfo>(_onGetAllCartEvent);
  }

  FutureOr<void> _onGetAllCartEvent(GetAllCartInfo event, Emitter<GetAllCartState> emit) async{
    try {
      emit(const GetAllCartLoading());

      final model = await getAllCartRepo();
      if (kDebugMode) {
        print(model.length);
      }

      emit(GetAllCartSuccess(model));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(GetAllCartFail(e.toString()));
    }

  }
}
