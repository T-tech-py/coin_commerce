class CategoryEntity{
  final String name;

  CategoryEntity({required this.name});

  factory CategoryEntity.fromJson(Map<String,dynamic> json){
    return CategoryEntity(name: json['name']??'');
  }
}