part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetAllCategoriesModel extends HomeState{
  final List<CategoryModel> model;

  GetAllCategoriesModel(this.model);
}

class GetTopProducts extends HomeState{
  final List<ProductModel> products;

  GetTopProducts(this.products);
}

