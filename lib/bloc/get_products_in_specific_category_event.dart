part of 'get_products_in_specific_category_bloc.dart';

abstract class GetProductsInSpecificCategoryEvent extends Equatable {
  const GetProductsInSpecificCategoryEvent();
  @override
  List<Object> get props => [];
}

class GetProDuctsInSpecificCategoryInfo extends GetProductsInSpecificCategoryEvent{
final String category;
  const GetProDuctsInSpecificCategoryInfo(this.category) : super();

@override
List<Object> get props => [category];
}
