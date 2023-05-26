part of 'get_limited_results_bloc.dart';

abstract class GetLimitedResultsState extends Equatable {
  const GetLimitedResultsState();
  @override
  List<Object> get props => [];
}

class GetLimitedResultsInitial extends GetLimitedResultsState {}

class GetLimitedResultsLoading extends GetLimitedResultsState{

  const GetLimitedResultsLoading() : super();
}

class GetLimitedResultsSuccess extends GetLimitedResultsState{
  final List<Products> data;

  const GetLimitedResultsSuccess(this.data) : super();

  @override
  List<Object> get props => [];
}
class GetLimitedResultsFail extends GetLimitedResultsState{
  final dynamic error;

  const GetLimitedResultsFail(this.error) : super();

  @override
  List<Object> get props => [error];
}

//class
