import 'package:orders/orders/domain/model/order_model.dart';

class OrderEntity extends OrderModel{
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;

  final DateTime registered;

  OrderEntity({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  }) : super(id: id, isActive: isActive, price: price, company: company,
   picture: picture, buyer: buyer, tags: tags, status: status, registered: registered);

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: List<String>.from(json['tags']),
      status: json['status'],
      registered: DateTime.parse(json['registered']),
    );
  }
  
  @override

  List<Object?> get props => [
   id,
   isActive,
   price,
   company,
   picture,
   buyer,
   tags,
   status,
   registered,
  ];
  

}