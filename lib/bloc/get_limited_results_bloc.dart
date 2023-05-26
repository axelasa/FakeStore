import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../model/products.dart';
import '../network_call/api_call.dart';

part 'get_limited_results_event.dart';
part 'get_limited_results_state.dart';

class GetLimitedResultsBloc extends Bloc<GetLimitedResultsEvent, GetLimitedResultsState> {
  GetLimitedResultsBloc() : super(GetLimitedResultsInitial()) {
    on<GetLimitedResultsInfo>(_onGetLimitedResultsEvent);


  }

  FutureOr<void> _onGetLimitedResultsEvent(GetLimitedResultsInfo event, Emitter<GetLimitedResultsState> emit) async {

    try{
      emit(const GetLimitedResultsLoading());
      final model = await getLimitedResults(event.id);
      if (kDebugMode) {
        print(model.length);
      }
      emit(GetLimitedResultsSuccess(model));
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(GetLimitedResultsFail(e.toString()));
    }
  }
}
