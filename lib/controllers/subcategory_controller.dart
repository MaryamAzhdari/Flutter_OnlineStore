import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_store/global_variable.dart';
import 'package:online_store/models/subcategory_model.dart';


class SubCategoryController {
  
  //Get Categories
  Future<List<SubCategoryModel>> loadSubCategories() async {
    try {
      http.Response response = await http.get(Uri.parse('$uri/api/subcategory'),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      //print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        final List<dynamic> data = jsonDecode(response.body);
        List<SubCategoryModel> categories = data
            .map((subcategory) => SubCategoryModel.fromJson(subcategory))
            .toList();
        return categories;
      } else {
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Categories');
      }
    } catch (e) {
      throw Exception('Error loading Categories: $e');
    }
  }
}
