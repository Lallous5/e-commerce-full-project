import 'package:ecommerce_using_getx/models/product_model.dart';
import 'package:ecommerce_using_getx/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModels>?> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    try {
      if (response.statusCode == 200) {
        var jsonData = response.body;
        return productModelsFromJson(jsonData);
      } else if (response.statusCode == 403) {
        print("Request failed with status: ${response.statusCode}.");
      } else if (response.statusCode == 500) {
        print("Request failed with status: ${response.statusCode}.");
      } else {
        print("Request failed with status: ${response.statusCode}.");
      }
    } catch (ecveptiomn) {
      print("Error happend");
    }
  }
}

// ignore_for_file: file_names, avoid_print, camel_case_types, body_might_complete_normally_nullable

// import 'package:http/http.dart' as http;
// import 'dart:io';

// class ProductServices {
//    Future<List<ProductModels>?> getProduct() async {
   
//     try { 
//      var res = await http.get(Uri.parse('$baseUrl/products'));
//       if (res.statusCode == 200) {
//         var json = res.body;
//         return productModelsFromJson(json);
//       } else if (res.statusCode == 403) {
//         print("Request failed with status: ${res.statusCode}.");
//       } else if (res.statusCode == 500) {
//         print("Request failed with status: ${res.statusCode}.");
//       } else {
//         print("Request failed with status: ${res.statusCode}.");
//       }
//     } on SocketException {
//       print("Check your internet connection");
//     } on FormatException {
//       print("Problem retriving data");
//     } catch (ecveptiomn) {
//       print("Error happend");
//     }
//   }
// }
