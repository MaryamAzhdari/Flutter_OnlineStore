import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_store/global_variable.dart';
import 'package:online_store/models/bannr_model.dart';

class BannerController {
  //Get Banners
  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(Uri.parse("$uri/api/banner"),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Banners');
      }
    } catch (e) {
      throw Exception('Error loading Banners: $e');
    }
  }
}
