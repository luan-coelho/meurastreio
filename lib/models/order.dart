class Order {
  final String id;
  final String name;
  final String description;
  final String trackingNumber;
  final String carrier;
  final DateTime dateShipped;
  final DateTime? dateDelivered;
  final String status;
  final List<OrderHistoryItem> history;

  Order({
    required this.id,
    required this.name,
    required this.description,
    required this.trackingNumber,
    required this.carrier,
    required this.dateShipped,
    this.dateDelivered,
    required this.status,
    required this.history,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      trackingNumber: json['trackingNumber'],
      carrier: json['carrier'],
      dateShipped: DateTime.parse(json['dateShipped']),
      dateDelivered: json['dateDelivered'] != null
          ? DateTime.parse(json['dateDelivered'])
          : null,
      status: json['status'],
      history: (json['history'] as List)
          .map((item) => OrderHistoryItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'trackingNumber': trackingNumber,
      'carrier': carrier,
      'dateShipped': dateShipped.toIso8601String(),
      'dateDelivered': dateDelivered?.toIso8601String(),
      'status': status,
      'history': history.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderHistoryItem {
  final DateTime date;
  final String location;
  final String status;

  OrderHistoryItem({
    required this.date,
    required this.location,
    required this.status,
  });

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) {
    return OrderHistoryItem(
      date: DateTime.parse(json['date']),
      location: json['location'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'location': location,
      'status': status,
    };
  }
}
