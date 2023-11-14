class SubCategoryResponse {
  bool error;
  String message;
  SubCategoryData data;

  SubCategoryResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryResponse(
      error: json['error'],
      message: json['message'],
      data: SubCategoryData.fromJson(json['data']),
    );
  }
}

class SubCategoryData {
  List<SubCategory> subcategories;

  SubCategoryData({
    required this.subcategories,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> json) {
    var subcategoriesList = json['subcategories'] as List;
    List<SubCategory> subcategories =
        subcategoriesList.map((item) => SubCategory.fromJson(item)).toList();

    return SubCategoryData(
      subcategories: subcategories,
    );
  }
}

class SubCategory {
  int id;
  String name;
  String imageUrl;

  SubCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}

//////////////////////////////////////////////////////

class DefaultFood {
  bool error;
  String message;
  Data data;

  DefaultFood({
    required this.error,
    required this.message,
    required this.data,
  });

  factory DefaultFood.fromJson(Map<String, dynamic> json) => DefaultFood(
        error: json["error"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Product> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  String name;
  int barcode;
  int id;
  String imageUrl;
  double rate;
  int time;
  int unitId;
  int quantity;

  Product({
    required this.name,
    required this.barcode,
    required this.id,
    required this.imageUrl,
    required this.rate,
    required this.time,
    required this.unitId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json["name"],
      barcode: json["barcode"],
      id: json["id"],
      imageUrl: json["image_url"],
      rate: json["rate"],
      time: json["time"] ?? "",
      unitId: json["UnitID"],
      quantity: 0);

  Map<String, dynamic> toJson() => {
        "name": name,
        "barcode": barcode,
        "id": id,
        "image_url": imageUrl,
        "rate": rate,
        "time": time,
        "UnitID": unitId,
        "quantity": quantity
      };
}
