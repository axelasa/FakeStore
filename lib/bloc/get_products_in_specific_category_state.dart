part of 'get_products_in_specific_category_bloc.dart';

abstract class GetProductsInSpecificCategoryState extends Equatable {
  const GetProductsInSpecificCategoryState();
  @override
  List<Object> get props => [];
}

class GetProductsInSpecificCategoryInitial extends GetProductsInSpecificCategoryState {}

class GetProDuctsInSpecificCategoryLoading extends GetProductsInSpecificCategoryState{

  const GetProDuctsInSpecificCategoryLoading():super();


}

class GetProDuctsInSpecificCategorySuccess extends GetProductsInSpecificCategoryState{
  final List<Products?> data;

  const GetProDuctsInSpecificCategorySuccess(this.data) : super();

  @override
  List<Object> get props => [];
}

class GetProDuctsInSpecificCategoryFail extends GetProductsInSpecificCategoryState{
  final dynamic error;

  const GetProDuctsInSpecificCategoryFail(this.error) : super();

  @override
  List<Object> get props => [error];

}
