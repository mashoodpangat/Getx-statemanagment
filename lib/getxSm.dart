import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:getx_flutter/model%20class.dart';

import 'package:http/http.dart' as http;

class myGetx extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() async {
    await fetchData();
    await getproductCategory();
    super.onInit();
  }

  late SubCategoryResponse openseaModel;
  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.post(
          Uri.tryParse('http://cheffconnect.voxo.pro/api/get_sub_categories')!,
          body: ({'cat_id': '-1', 'PriceGroupID': '1'}));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        SubCategoryResponse openseaModelresponse =
            SubCategoryResponse.fromJson(result);
        openseaModel = openseaModelresponse;
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  late DefaultFood productCategory;

  getproductCategory() async {
    try {
      isLoading(true);
      http.Response response = await http.post(
          Uri.parse(
              "http://cheffconnect.voxo.pro/api/get_products_by_category"),
          body: ({'cat_id': '1'}));

      if (response.statusCode == 200) {
        // print(response.body);
        // print(response.statusCode);
        final jsonBody = jsonDecode(response.body);

        DefaultFood productCategoryResponse = DefaultFood.fromJson(jsonBody);

        productCategory = productCategoryResponse;
        print(response.body);

        // return jsonBody;
      } else {
        throw Exception(e);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
