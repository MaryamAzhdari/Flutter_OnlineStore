import 'package:flutter/material.dart';
import 'package:online_store/controllers/category_controller.dart';
import 'package:online_store/models/category_model.dart';
import 'package:online_store/theme.dart';
import 'package:online_store/views/widgets/header_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<CategoryModel>> futureCategory;
  CategoryModel? _selectedCategoty;
  @override
  void initState() {
    super.initState();
    futureCategory = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: const HeaderWidget()),
      body: Row(
        children: [
          //Left Side - display category
          Expanded(
              flex: 2,
              child: Container(
                  color: Colors.grey.shade200,
                  child: FutureBuilder(
                      future: futureCategory,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('No Categories'),
                          );
                        } else {
                          final categories = snapshot.data!;
                          return ListView.builder(
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      _selectedCategoty = category;
                                    });
                                  },
                                  title: Text(
                                    category.name,
                                    style: TextStyle(
                                        color: _selectedCategoty == category
                                            ? AppTheme.mcCustomBtnCircle1Color
                                            : AppTheme.mcDarkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              });
                        }
                      }))),

          //right side - display selected category details
          Expanded(
              flex: 5,
              child: _selectedCategoty != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                _selectedCategoty!.name,
                                // style: TextStyle(
                                //     color: _selectedCategoty == category
                                //         ? AppTheme.mcCustomBtnCircle1Color
                                //         : AppTheme.mcDarkGreyColor,
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              _selectedCategoty!.banner),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container()),
        ],
      ),
    );
  }
}
