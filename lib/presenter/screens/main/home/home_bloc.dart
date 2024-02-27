import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/category_model.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/db_services.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    emit(HomeInitial());
    on<HomeCategoryEvent>((event, emit) async{

      List<CategoryModel> products = await SqliteService().getItems();
      emit(GetAllCategoriesModel(products));

    });

    on<HomeProductEvent>((event, emit)async{
      List<ProductModel> products = await SqliteService().getProduct();
      emit(GetTopProducts(products));

    });
  }
}
