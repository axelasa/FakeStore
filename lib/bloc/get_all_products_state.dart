part of 'get_all_products_bloc.dart';

abstract class GetAllProductsState extends Equatable {
  const GetAllProductsState();
  @override
  List<Object?> get props => [];
}

class GetAllProductsInitial extends GetAllProductsState {}

 class GetAllProductsLoading extends GetAllProductsState{
  const GetAllProductsLoading() : super();
 }

 class GetAllProductsSuccess extends GetAllProductsState{
  final GetAllProducts? data;

  const GetAllProductsSuccess(this.data) : super();
  @override
   List<Object>get props => [];
 }
 class GetAllProductsFail extends GetAllProductsState{
  final dynamic error;

  const GetAllProductsFail(this.error) : super();
  @override
   List<Object>get props => [error];
 }
