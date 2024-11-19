import 'package:flutter/material.dart';
import 'package:online_store/controllers/category_controller.dart';
import 'package:online_store/models/category_model.dart';
import 'package:online_store/theme.dart';


class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  //A future that will hold list of banners once loaded from API
  late Future<List<CategoryModel>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCategory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Categories'),
            );
          } else {
            final categories = snapshot.data!;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2
                        ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      Image.network(
                        category.image,
                        width: 50,
                        height: 50,
                      ),
                      Text(category.name,
                      style: const TextStyle(
                                    color: AppTheme.mcDarkGreyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),)
                    ],
                  );
                });
          }
        });
  }
}
