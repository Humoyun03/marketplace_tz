



class CategoryModel{
  String image;
  String name;

  CategoryModel({required this.image,required this.name});

  CategoryModel.fromMap(Map<dynamic, dynamic> item):
        image=item["image"], name= item["name"];

  Map<String, dynamic> toMap(){
    return {'image':image,'name': name};
  }
}
