part of 'get_product_details_bloc.dart';

abstract class GetProductDetailsEvent extends Equatable {
  const GetProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailsInfo extends GetProductDetailsEvent {
  final int id;
  const GetProductDetailsInfo(this.id): super();

  @override
  List<Object> get props => [id];

}

