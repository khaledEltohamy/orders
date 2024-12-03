import 'package:orders/orders/data/entity/order_entity.dart';


abstract class BaseDatasource {
 Future<List<OrderEntity>> loadOrders();
}