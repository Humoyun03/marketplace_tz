import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data/models/catalog_item_model.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../../data/services/db_services.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    emit(CatalogInitial());
    on<CatalogEvent>((event, emit) async {
      List<CategoryModel> products = await SqliteService().getItems();
      emit(GetAllCategoriesModel(products));

    });

    on<CatalogItemProductEvent>((event, emit) async{
      List<CatalogItemModel> products = await SqliteService().getCatalogItems();
      emit(GetTopProducts(products));
    });
  }
}
