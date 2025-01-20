class PlaceModel {
  final String namePlace;
  final String type;
  final String address;
  final String image;
  final List<ProductModel> products;

  PlaceModel({
    required this.namePlace,
    required this.type,
    required this.address,
    required this.image,
    required this.products,
  });

  factory PlaceModel.fromMap(Map<String, dynamic> data) {
    List<dynamic> productsData = data['products'] ?? [];
    List<ProductModel> productModels =
        productsData.map((e) => ProductModel.fromMap(e)).toList();

    return PlaceModel(
      namePlace: data['title'] ?? '',
      type: data['subTitle'] ?? '',
      address: data['address'] ?? '',
      image: data['image'] ?? '',
      products: productModels,
    );
  }
}

class ProductModel {
  final String nameProduct;
  final String namePlace;
  final String typePlace;
  final String price;
  final String oldPrice;
  final String image;

  ProductModel({
    required this.nameProduct,
    required this.namePlace,
    required this.typePlace,
    required this.price,
    required this.oldPrice,
    required this.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      nameProduct: data['nameProduct'] ?? '',
      namePlace: data['namePlace'] ?? '',
      typePlace: data['type'] ?? '',
      price: data['price'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
