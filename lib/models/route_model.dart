import 'package:cloud_firestore/cloud_firestore.dart';

class RouteModel {
  String? assignedDate;
  List<dynamic>? completedVisits;
  String? promoterId;
  String? routeId;
  String? status;
  List<String>? storeIds;
  Map<String, dynamic>? storesToVisit;

  RouteModel({
    this.assignedDate,
    this.completedVisits,
    this.promoterId,
    this.routeId,
    this.status,
    this.storeIds,
    this.storesToVisit,
  });

  Map<String, dynamic> toFirestoreMap() {
    return {
      'assigned_date': assignedDate,
      'completed_visits': completedVisits,
      'promoter_id': promoterId,
      'route_id': routeId,
      'status': status,
      'store_ids': storeIds,
      'stores_to_visit': storesToVisit,
    };
  }

  factory RouteModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RouteModel(
      assignedDate: data['assigned'],
      promoterId: data['promoter_id'],
      completedVisits: data['completed_visits']?.cast<String, dynamic>(),
      routeId: data['route_id'],
      status: data['status'],
      storeIds: data['store_ids'],
      storesToVisit: data['stores_to_visit'],
    );
  }
}
