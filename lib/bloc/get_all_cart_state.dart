part of 'get_all_cart_bloc.dart';

abstract class GetAllCartState extends Equatable {
  const GetAllCartState();

  @override
  List<Object> get props => [];
}

class GetAllCartInitial extends GetAllCartState {}

class GetAllCartLoading extends GetAllCartState{

  const GetAllCartLoading(): super();
}

class GetAllCartSuccess extends GetAllCartState{
final List<GetCart?> data;
  const GetAllCartSuccess(this.data):super();

  @override
  List<Object> get props => [];
}

class GetAllCartFail extends GetAllCartState{
  final dynamic error;

  const GetAllCartFail(this.error) : super();

  @override
  List<Object> get props => [];
}
