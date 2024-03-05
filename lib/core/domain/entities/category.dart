class CategoryEntity{
  final String name;

  CategoryEntity({required this.name});

  factory CategoryEntity.fromJson(String json){
    return CategoryEntity(name: json);
  }
}