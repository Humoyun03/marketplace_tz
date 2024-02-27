


class CatalogItemModel{
  String image;
  String name;

  CatalogItemModel({required this.image,required this.name});

  CatalogItemModel.fromMap(Map<dynamic, dynamic> item):
        image=item["image"], name= item["name"];

  Map<String, dynamic> toMap(){
    return {'image':image,'name': name};
  }
}