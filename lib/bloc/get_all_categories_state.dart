part of 'get_all_categories_bloc.dart';

abstract class GetAllCategoriesState extends Equatable {
  const GetAllCategoriesState();
  @override
  List<Object> get props => [];
}

class GetAllCategoriesInitial extends GetAllCategoriesState {}

class GetAllCategoriesLoading extends GetAllCategoriesState{
  const GetAllCategoriesLoading():super();
}

class GetAllCategoriesSuccess extends GetAllCategoriesState{
  final AllCategories? data;
  const GetAllCategoriesSuccess(this.data):super();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesFail extends GetAllCategoriesState{
  final dynamic error;

  const GetAllCategoriesFail(this.error):super();

  @override
  List<Object> get props =>[error];
}