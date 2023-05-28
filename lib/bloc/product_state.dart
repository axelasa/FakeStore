part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState{

  const ProductLoading():super();
}

class ProductSuccess extends ProductState{
  final Object data;

  const ProductSuccess(this.data) : super();

  @override
  List<Object> get props => [];

}

class ProductFail extends ProductState{
  final dynamic error;

  const ProductFail(this.error) : super();

  @override
  List<Object> get props => [error];
}