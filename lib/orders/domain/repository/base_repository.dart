import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:orders/orders/domain/model/order_model.dart';
import '../../../core/errors/faliure.dart';

abstract class BaseRepository extends Equatable{
  Future<Either<Failure,List<OrderModel>>> loadOrders();
} 