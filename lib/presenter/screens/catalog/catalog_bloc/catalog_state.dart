part of 'catalog_bloc.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}


class GetAllCategoriesModel extends CatalogState{
  final List<CategoryModel> model;

  GetAllCategoriesModel(this.model);
}

class GetTopProducts extends CatalogState{
  final List<CatalogItemModel> products;

  GetTopProducts(this.products);
}

