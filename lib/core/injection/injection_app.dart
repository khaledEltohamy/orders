
import 'package:get_it/get_it.dart';
import 'package:orders/orders/data/datasource/base_datasource.dart';
import 'package:orders/orders/data/datasource/json_datasource.dart';
import 'package:orders/orders/data/repository/imp_repository.dart';
import 'package:orders/orders/domain/usecase/graph_orders_usecase.dart';
import 'package:orders/orders/domain/usecase/metric_orders_usecase.dart';
import 'package:orders/orders/presentation/bloc/mertic_bloc/metric_orders_bloc.dart';

import '../../orders/domain/repository/base_repository.dart';
import '../../orders/presentation/bloc/graph_bloc/graph_orders_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {

//Cubits - Blocs
 
  getIt.registerLazySingleton<GraphOrdersBloc>(
      () => GraphOrdersBloc(getIt()));

  getIt.registerLazySingleton<MetricOrdersBloc>(
      () => MetricOrdersBloc(getIt()));
//UseCases

  getIt.registerLazySingleton<MetricOrdersUseCase>(
      () => MetricOrdersUseCase( repository: getIt()));
  getIt.registerLazySingleton<GraphOrdersUseCase>(
      () => GraphOrdersUseCase( repository: getIt()));
//Repositories

  getIt.registerLazySingleton<BaseRepository>(
      () => ImpRepository(  datasource: getIt()));


//DataSource

  getIt.registerLazySingleton<BaseDatasource>(
      () => JsonDatasource());


}
