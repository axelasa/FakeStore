part of 'get_limited_results_bloc.dart';

abstract class GetLimitedResultsEvent extends Equatable {
  const GetLimitedResultsEvent();
  @override
  List<Object> get props => [];
}

class GetLimitedResultsInfo extends GetLimitedResultsEvent{
  final int id;

  const GetLimitedResultsInfo(this.id) : super();

  @override
  List<Object> get props => [id];
}
