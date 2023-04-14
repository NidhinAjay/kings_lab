import 'package:kings_lab/source_model_class.dart';

class products
{
  Source? source;
  String? title;
  String? description;
  String? brand;
  String? category;
  String? thumbnail;
  String? price;
  String? discountPercentage;
  String? rating;
  String? stock;


  products({
    this.source,
    this.title,
    this.description,
    this.brand,
    this.category,
    this.thumbnail,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,

  });


  factory products.fromJson(Map<String, dynamic> json){
    return products(
      source: Source.fromJson(json['source']),
      title: json['title'],
      description: json['description'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
    );
  }
}