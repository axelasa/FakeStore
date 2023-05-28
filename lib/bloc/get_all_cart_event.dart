part of 'get_all_cart_bloc.dart';

abstract class GetAllCartEvent extends Equatable {
  const GetAllCartEvent();
  @override
  List<Object?> get props => [];
}
class GetAllCartInfo extends GetAllCartEvent{}
