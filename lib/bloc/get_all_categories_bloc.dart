
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store/network_call/api_call.dart';
import 'package:flutter/foundation.dart';

import '../model/products.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

class GetAllCategoriesBloc extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc() : super(GetAllCategoriesInitial()) {
    on<GetAllCategoriesInfo>(_onGetAllCategoriesEvent);
}
  FutureOr<void> _onGetAllCategoriesEvent(GetAllCategoriesInfo event, Emitter<GetAllCategoriesState> emit) async{

      try{
        emit(const GetAllCategoriesLoading());
        final model = await getAllCategoriesRepo();
        if (kDebugMode) {
          print(model);
        }
        emit(GetAllCategoriesSuccess(model));
      }catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
        emit(GetAllCategoriesFail(e.toString()));
      }
    }
}

