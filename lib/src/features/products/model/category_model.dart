class CategoryModel {
  final String slug;
  final String name;
  final String url;

  CategoryModel({
    required this.slug,
    required this.name,
    required this.url
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
