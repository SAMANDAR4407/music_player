import 'package:lesson_afb_5/models/category_model.dart';

List<CategoryModel> getCategories() {
  return <CategoryModel>[
    CategoryModel("Trending", true),
    CategoryModel("Latest", false),
    CategoryModel("Politics", false),
    CategoryModel("Health", false),
    CategoryModel("Latest", false)
  ];
}
