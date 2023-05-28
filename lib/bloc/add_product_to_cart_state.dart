part of 'add_product_to_cart_bloc.dart';

abstract class AddProductToCartState extends Equatable {
  const AddProductToCartState();
}

class AddProductToCartInitial extends AddProductToCartState {
  @override
  List<Object> get props => [];
}
