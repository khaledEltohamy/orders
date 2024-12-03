import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:orders/orders/data/datasource/base_datasource.dart';

import '../entity/order_entity.dart';

class JsonDatasource extends BaseDatasource {
  @override
  Future<List<OrderEntity>> loadOrders() async{
    try {
 
  final String response = await rootBundle.loadString('assets/orders.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => OrderEntity.fromJson(json)).toList();
    
    }catch (e){ 
     throw Exception(e);
    }

  }

}