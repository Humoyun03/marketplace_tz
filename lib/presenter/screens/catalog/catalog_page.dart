

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/catalog_item_model.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/services/db_services.dart';
import '../../components/catalog_page_components.dart';
import '../../components/main_page_components.dart';
import 'catalog_bloc/catalog_bloc.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<CatalogItemModel> catalogItems = [];
  List<CategoryModel> categoryHolder = [];
  final bloc = CatalogBloc();
  bool isLoading = false;
  var controller = TextEditingController();


  Future getItems() async {
    setState(() {
      isLoading = true;
    });
    List<Map<String,dynamic>> enter = await SqliteService().getEnter1();
    if(enter.isEmpty){
      await SqliteService().createCatalogItem();
      await SqliteService().createItem();
    }
    await SqliteService().createEnter1();
    categoryHolder = await SqliteService().getItems();
    catalogItems = (await SqliteService().getCatalogItems()).cast<CatalogItemModel>();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    bloc.add(CatalogItemProductEvent());
    bloc.add(CatalogItemCategoryEvent());
    getItems();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:bloc,
      child: BlocConsumer<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is GetAllCategoriesModel) {
            setState(() {

              // categoryHolder.addAll(state.model);
            });

          }
          if (state is GetTopProducts) {
            setState(() {
              // productHolder.addAll(state.products);
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                      child: Container(
                        height: 50,
                        child: InputText("Mahsulot nomini kiriting"
                            , TextInputType.text, controller, 20, (p0) { }, "assets/images/bubble.png"),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryHolder.length,
                        itemBuilder: (context, index) {
                          if (index == categoryHolder.length - 1) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: categoryItem2(
                                  categoryHolder[index].name ?? '',
                                  categoryHolder[index].image ?? '',(){
            
                              }),
                            );
                          } else {
                            return categoryItem2(
                                categoryHolder[index].name ?? '',
                                categoryHolder[index].image ?? '', (){
            
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItemLong("Gazli ichimliklar", "assets/images/catalogitem1.png", context),
                          categoryItem("Gazsiz ichimliklar", "assets/images/nestle.png", context),
                        ],
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 2.2),
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: catalogItems.length,
                      itemBuilder: (context, index) {

                          return categoryItem(
                            catalogItems[index].name ?? "",
                            catalogItems[index].image ?? "",context
                          );

            
                      },
                    ),
            
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

