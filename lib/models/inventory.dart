import 'package:cloud_firestore/cloud_firestore.dart';

class Inventory {
  List<dynamic>? exhibitionPlace;
  List<Measure>? measures;
  String? amount;
  String? brandName;
  Timestamp? createdAt;
  Timestamp? expiryDate;
  Timestamp? lastUpdate;
  String? overstockLimit;
  String? presentation;
  String? price;
  List<dynamic>? productImages;
  String? productName;
  String? shortageLimit;
  String? sku;
  String? storeId;

  Inventory({
    this.exhibitionPlace,
    this.measures,
    this.amount,
    this.brandName,
    this.createdAt,
    this.expiryDate,
    this.lastUpdate,
    this.overstockLimit,
    this.presentation,
    this.price,
    this.productImages,
    this.productName,
    this.shortageLimit,
    this.sku,
    this.storeId,
  });

  Map<String, dynamic> toFirestoreMap() {
    return {
      'exhibition_place': exhibitionPlace,
      'measures': measures?.map((m) => m.toMap()).toList(),
      'amount': amount,
      'brand_name': brandName,
      'created_at': createdAt,
      'expiry_date': expiryDate,
      'last_update': lastUpdate,
      'overstock_limit': overstockLimit,
      'presentation': presentation,
      'price': price,
      'product_images': productImages,
      'product_name': productName,
      'shortage_limit': shortageLimit,
      'sku': sku,
      'store_id': storeId,
    };
  }

  factory Inventory.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Inventory(
      exhibitionPlace: data['exhibition_place'],
      measures: (data['measures'] as List<dynamic>?)
          ?.map((m) => Measure.fromMap(m))
          .toList(),
      amount: data['amount'],
      brandName: data['brand_name'],
      createdAt: data['created_at'],
      expiryDate: data['expiry_date'],
      lastUpdate: data['last_update'],
      overstockLimit: data['overstock_limit'],
      presentation: data['presentation'],
      price: data['price'],
      productImages: data['product_images'],
      productName: data['product_name'],
      shortageLimit: data['shortage_limit'],
      sku: data['sku'],
      storeId: data['store_id'],
    );
  }
}

class Measure {
  String? high;
  String? long;
  String? broad;

  Measure({
    this.high,
    this.long,
    this.broad,
  });

  Map<String, dynamic> toMap() {
    return {
      'high': high,
      'broad': broad,
      'long': long,
    };
  }

  factory Measure.fromMap(Map<String, dynamic> map) {
    return Measure(
      high: map['high'],
      broad: map['broad'],
      long: map['long'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      'broad': broad,
      'high': high,
      'long': long,
    };
  }

  static Measure fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Measure(
      broad: data['broad'],
      high: data['high'],
      long: data['long'],
    );
  }
}
