part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}


class CatalogItemCategoryEvent extends CatalogEvent{}
class CatalogItemProductEvent extends CatalogEvent{}
