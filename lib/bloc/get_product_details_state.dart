part of 'get_product_details_bloc.dart';

abstract class GetProductDetailsState extends Equatable {
  const GetProductDetailsState();

  @override
  List<Object> get props => [];
}

class GetProductDetailsInitial extends GetProductDetailsState {}

class GetProductDetailsLoading extends GetProductDetailsState{
  const GetProductDetailsLoading() : super();
}

class GetProductDetailsSuccess extends GetProductDetailsState{
  final Products? data;
  const GetProductDetailsSuccess(this.data) : super();

  @override
  List<Object> get props => [];
}

class GetProductDetailsFail extends GetProductDetailsState{
  final dynamic error;

  const GetProductDetailsFail(this.error) : super();

  @override
  List<Object> get props =>[error];
}