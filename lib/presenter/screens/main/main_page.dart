

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/services/db_services.dart';
import '../../components/main_page_components.dart';
import 'home/home_bloc.dart';



class MainPage extends StatefulWidget {
  String street;

  MainPage({required this.street});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryModel> categoryHolder = [];
  List<ProductModel> productHolder = [];
  final bloc = HomeBloc();
  bool isLoading = false;
  var controller = TextEditingController();

  Future getItems() async {
    setState(() {
      isLoading = true;
    });
    List<Map<String,dynamic>> enter = await SqliteService().getEnter1();
    if(enter.isEmpty){
      await SqliteService().createItem();
      await SqliteService().createProduct();
    }
    await SqliteService().createEnter1();
    categoryHolder = await SqliteService().getItems();
    productHolder = (await SqliteService().getProduct()).cast<ProductModel>();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    bloc.add(HomeCategoryEvent());
    bloc.add(HomeProductEvent());
    getItems();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
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
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Image.asset('assets/images/man.png'),
                        ),
                        const SizedBox(width: 10,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Sizning manzilingiz", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w400),),
                            Text("${widget.street}", style: const TextStyle(color: Color(
                                0xFF090909), fontSize: 14, fontWeight: FontWeight.w500),),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              color: Color(0xFFF1EFEF),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Image.asset('assets/images/basket.png', height: 25,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              color: Color(0xFFF1EFEF),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Image.asset('assets/images/alarm.png', height: 25,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              drawer: Drawer(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 36,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(36),
                              child: Image.asset(
                                'assets/images/img (2).png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 18,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Salom 👋',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Xurshid',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      Column(
                        children: [
                          ListTile(
                            title: Text('Keshbek',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.wallet,color: Colors.blueAccent,),
                            trailing: Text('0.0 so`m',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Shaxsiy ma`lumotlar',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.person,color: Colors.blueAccent,),
                            trailing: Icon(Icons.arrow_circle_right),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Mening kartalarim',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.credit_card_sharp,color: Colors.blueAccent,),
                            trailing: Icon(Icons.arrow_circle_right),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Manzillar',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.location_on,color: Colors.blueAccent,),
                            trailing: Icon(Icons.arrow_circle_right),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Xavfsizlik',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.privacy_tip,color: Colors.blueAccent,),
                            trailing: Text('O`chiq',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "settings");
                            },
                            child: ListTile(
                              title: Text('Sozlamalar',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),),
                              leading: Icon(Icons.settings,color: Colors.blueAccent,),
                              trailing: Icon(Icons.arrow_circle_right),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Biz haqimizda',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.info,color: Colors.blueAccent,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Keshbek',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.live_help,color: Colors.blueAccent,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Ulashish',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),),
                            leading: Icon(Icons.share,color: Colors.blueAccent,),

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Chiqish',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.redAccent
                            ),),
                            leading: Icon(Icons.logout_sharp,color: Colors.redAccent,),
                          ),

                        ],
                      ),

                      Text('Versiya 1.1.0',style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400
                      ),)
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                      child: Container(
                        height: 50,
                        child: InputText("Mahsulot nomini kiriting"
                            , TextInputType.text, controller, 20, (p0) { }, "assets/images/barcode.png"),
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
                    const SizedBox(height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text("Eng ommabop mahsulotlar", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18 ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Text("Barchasi", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14 ),),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 295,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productHolder.length,
                        itemBuilder: (context, index) {
                          if (index == productHolder.length - 1) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: productItem2(
                                  productHolder[index].name ?? '',
                                  productHolder[index].image ?? '',
                                  productHolder[index].capacity ?? '',
                                  productHolder[index].price.toString() ?? '',
                              ),
                            );
                          } else {
                            return productItem2(
                              productHolder[index].name ?? '',
                              productHolder[index].image ?? '',
                              productHolder[index].capacity ?? '',
                              productHolder[index].price.toString() ?? '',

                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 180,
                      child: mainComponent(context),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 180,
                      child: mainComponent(context),

                    ),
                    SizedBox(height: 20,),

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
