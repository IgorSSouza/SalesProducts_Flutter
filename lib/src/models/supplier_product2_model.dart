class Product2 {
  bool? hasDiscount;
  String? name;
  List<String> gallery = [""];
  String? description;
  String? price;
  String discountValue = "";
  Details? details;
  String? id;

  Product2(this.hasDiscount, this.name, this.gallery, this.description,
      this.price, this.discountValue, this.details, this.id);

  Product2.fromJson(Map<String, dynamic> json) {
    hasDiscount = json['hasDiscount'];
    name = json['name'];
    gallery = json['gallery'].cast<String>();
    description = json['description'];
    price = json['price'];
    discountValue = json['discountValue'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hasDiscount'] = hasDiscount;
    data['name'] = name;
    data['gallery'] = gallery;
    data['description'] = description;
    data['price'] = price;
    data['discountValue'] = discountValue;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Details {
  String? adjective;
  String? material;

  Details(this.adjective, this.material);

  Details.fromJson(Map<String, dynamic> json) {
    adjective = json['adjective'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adjective'] = adjective;
    data['material'] = material;
    return data;
  }
}
