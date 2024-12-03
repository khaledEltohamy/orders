import 'package:dartz/dartz.dart';
import 'package:orders/orders/domain/repository/base_repository.dart';

import '../../../core/errors/faliure.dart';
import '../model/metric_order_model.dart';

class MetricOrdersUseCase {
  final BaseRepository repository ;

  MetricOrdersUseCase({required this.repository}); 

   Future<Either<Failure, MetricOrderModel>> loadOrders()async{
  final result = await repository.loadOrders();
  return 
  result.fold(
    (failure)=>Left(failure), 
    (orders)=> Right(MetricOrderModel(orders: orders))
    );}


}

