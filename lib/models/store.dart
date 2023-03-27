import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  String? name;
  String? storeId;
  GeoPoint? mapLocation;
  String? customerId;
  Timestamp? createdAt;
  String? address;

  Store({
    this.name,
    this.storeId,
    this.mapLocation,
    this.customerId,
    this.createdAt,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'store_id': storeId,
      'map_location': mapLocation,
      'customer_id': customerId,
      'created_at': createdAt,
      'address': address,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['name'],
      storeId: map['store_id'],
      mapLocation: map['map_location'],
      customerId: map['customer_id'],
      createdAt: map['created_at'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      'name': name,
      'store_id': storeId,
      'map_location': mapLocation,
      'customer_id': customerId,
      'created_at': createdAt,
      'address': address,
    };
  }

  factory Store.fromFirestore(DocumentSnapshot doc) {
    Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
    return Store(
      name: data['name'],
      storeId: data['store_id'],
      mapLocation: data['map_location'],
      customerId: data['customer_id'],
      createdAt: data['created_at'],
      address: data['address'],
    );
  }
}
