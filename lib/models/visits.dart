import 'package:cloud_firestore/cloud_firestore.dart';

class Visit {
  Timestamp? createdAt;
  String? createdBy;
  String? customerId;
  Map<String, dynamic>? dataInStore;
  List<dynamic>? discontinuedItems;
  List<dynamic>? documents;
  GeoPoint? gpsLocation;
  List<dynamic>? inventoryItems;
  String? managerName;
  String? managerPosition;
  bool? managerPresent;
  String? managerSignature;
  String? promoterId;
  Map<String, String>? ratings;
  String? reportStatus;
  String? storeId;
  String? storeName;
  String? totalItems;
  String? visitId;
  String? visitDate;

  Visit({
    this.createdAt,
    this.createdBy,
    this.customerId,
    this.dataInStore,
    this.discontinuedItems,
    this.documents,
    this.gpsLocation,
    this.inventoryItems,
    this.managerName,
    this.managerPosition,
    this.managerPresent,
    this.managerSignature,
    this.promoterId,
    this.ratings,
    this.reportStatus,
    this.storeId,
    this.storeName,
    this.totalItems,
    this.visitId,
    this.visitDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt,
      'created_by': createdBy,
      'customer_id': customerId,
      'data_in_store': dataInStore,
      'discontinued_items': discontinuedItems,
      'documents': documents,
      'gps_location': gpsLocation,
      'inventory_items': inventoryItems,
      'manager_name': managerName,
      'manager_position': managerPosition,
      'manager_present': managerPresent,
      'manager_signature': managerSignature,
      'promoter_id': promoterId,
      'ratings': ratings,
      'report_status': reportStatus,
      'store_id': storeId,
      'store_name': storeName,
      'total_items': totalItems,
      'visit_id': visitId,
      'visit_date': visitDate,
    };
  }

  factory Visit.fromMap(Map<String, dynamic> map) {
    return Visit(
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      customerId: map['customer_id'],
      dataInStore: map['data_in_store']?.cast<String, dynamic>(),
      discontinuedItems: map['discontinued_items'],
      documents: map['documents'],
      gpsLocation: map['gps_location'],
      inventoryItems: map['inventory_items'],
      managerName: map['manager_name'],
      managerPosition: map['manager_position'],
      managerPresent: map['manager_present'],
      managerSignature: map['manager_signature'],
      promoterId: map['promoter_id'],
      ratings: map['ratings']?.cast<String, String>(),
      reportStatus: map['report_status'],
      storeId: map['store_id'],
      storeName: map['store_name'],
      totalItems: map['total_items'],
      visitId: map['visit_id'],
      visitDate: map['visit_date'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      'created_at': createdAt,
      'created_by': createdBy,
      'customer_id': customerId,
      'data_in_store': dataInStore,
      'discontinued_items': discontinuedItems,
      'documents': documents,
      'gps_location': gpsLocation,
      'inventory_items': inventoryItems,
      'manager_name': managerName,
      'manager_position': managerPosition,
    };
  }

  factory Visit.fromFirestoreMap(DocumentSnapshot doc) {
    Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
    return Visit(
      createdAt: data['created_at'],
      createdBy: data['created_by'],
      customerId: data['customer_id'],
      dataInStore: (data['data_in_store'])?.cast<String, dynamic>(),
      discontinuedItems: data['discontinued_items'],
      documents: data['documents'],
      gpsLocation: data['gps_location'],
      inventoryItems: data['inventory_items'],
      managerName: data['manager_name'],
      managerPosition: data['manager_position'],
      managerPresent: data['manager_present'],
      managerSignature: data['manager_signature'],
      promoterId: data['promoter_id'],
      ratings: data['ratings']?.cast<String, String>(),
      reportStatus: data['report_status'],
      storeId: data['store_id'],
      storeName: data['store_name'],
      totalItems: data['total_items'],
      visitId: data['visit_id'],
      visitDate: data['visit_date'],
    );
  }
}

class Item {
  List<dynamic>? additionalExibitionPhotos;
  String? batch;
  String? exhibitionPhoto;
  String? exhibitionPlace;
  String? expiration;
  String? expiryInSystem;
  String? expiryPhoto;
  String? incidence;
  String? itemId;
  String? price;
  String? priceInSystem;
  String? productName;
  String? shelfInventory;
  String? shelfInventoryInSystem;

  Item({
    this.additionalExibitionPhotos,
    this.batch,
    this.exhibitionPhoto,
    this.exhibitionPlace,
    this.expiration,
    this.expiryInSystem,
    this.expiryPhoto,
    this.incidence,
    this.itemId,
    this.price,
    this.priceInSystem,
    this.productName,
    this.shelfInventory,
    this.shelfInventoryInSystem,
  });

  Map<String, dynamic> toMap() {
    return {
      'additional_exibition_photos': additionalExibitionPhotos,
      'batch': batch,
      'exhibition_photo': exhibitionPhoto,
      'exhibition_place': exhibitionPlace,
      'expiration': expiration,
      'expiry_in_system': expiryInSystem,
      'expiry_photo': expiryPhoto,
      'incidence': incidence,
      'item_id': itemId,
      'price': price,
      'price_in_system': priceInSystem,
      'product_name': productName,
      'shelf_inventory': shelfInventory,
      'shelf_inventory_in_system': shelfInventoryInSystem,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      additionalExibitionPhotos: map['additional_exibition_photos'],
      batch: map['batch'],
      exhibitionPhoto: map['exhibition_photo'],
      exhibitionPlace: map['exhibition_place'],
      expiration: map['expiration'],
      expiryInSystem: map['expiry_in_system'],
      expiryPhoto: map['expiry_photo'],
      incidence: map['incidence'],
      itemId: map['item_id'],
      price: map['price'],
      priceInSystem: map['price_in_system'],
      productName: map['product_name'],
      shelfInventory: map['shelf_inventory'],
      shelfInventoryInSystem: map['shelf_inventory_in_system'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      'additional_exibition_photos': additionalExibitionPhotos,
      'batch': batch,
      'exhibition_photo': exhibitionPhoto,
      'exhibition_place': exhibitionPlace,
      'expiration': expiration,
      'expiry_in_system': expiryInSystem,
      'expiry_photo': expiryPhoto,
      'incidence': incidence,
      'item_id': itemId,
      'price': price,
      'price_in_system': priceInSystem,
      'product_name': productName,
      'shelf_inventory': shelfInventory,
      'shelf_inventory_in_system': shelfInventoryInSystem,
    };
  }

  factory Item.fromFirestore(DocumentSnapshot doc) {
    Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
    return Item(
      additionalExibitionPhotos: data['additional_exibition_photos'],
      batch: data['batch'],
      exhibitionPhoto: data['exhibition_photo'],
      exhibitionPlace: data['exhibition_place'],
      expiration: data['expiration'],
      expiryInSystem: data['expiry_in_system'],
      expiryPhoto: data['expiry_photo'],
      incidence: data['incidence'],
      itemId: data['item_id'],
      price: data['price'],
      priceInSystem: data['price_in_system'],
      productName: data['product_name'],
      shelfInventory: data['shelf_inventory'],
      shelfInventoryInSystem: data['shelf_inventory_in_system'],
    );
  }
}
