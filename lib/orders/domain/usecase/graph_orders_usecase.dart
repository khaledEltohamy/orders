import 'package:dartz/dartz.dart';
import 'package:orders/orders/domain/model/graph_order_model.dart';

import '../../../core/errors/faliure.dart';
import '../repository/base_repository.dart';

class GraphOrdersUseCase {
  final BaseRepository repository ;

  GraphOrdersUseCase({required this.repository}); 

 Future<Either<Failure, GraphOrderModel>> loadOrders()async {
  final result = await repository.loadOrders();
  return 
  result.fold(
    (failure)=>Left(failure), 
    (orders)=> Right(GraphOrderModel(orders: orders))
    );

  }
}