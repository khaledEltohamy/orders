import 'package:dartz/dartz.dart';
import 'package:orders/core/errors/faliure.dart';
import 'package:orders/orders/data/datasource/base_datasource.dart';
import 'package:orders/orders/domain/model/order_model.dart';
import 'package:orders/orders/domain/repository/base_repository.dart';

class ImpRepository extends BaseRepository{
  
  final BaseDatasource datasource;

  ImpRepository({required this.datasource});
  @override
  Future<Either<Failure, List<OrderModel>>> loadOrders()async {
    try {
      final response =  await datasource.loadOrders();
      return Right(response);
    }catch (e){
      return Left(FailureServiceWithResponse(msg: e.toString()));
    }
  }

  @override
  List<Object?> get props => [];
}