
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_product_to_cart_event.dart';
part 'add_product_to_cart_state.dart';

class AddProductToCartBloc extends Bloc<AddProductToCartEvent, AddProductToCartState> {
  AddProductToCartBloc() : super(AddProductToCartInitial()) {
    on<AddProductToCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
