


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders/domain/usecase/metric_orders_usecase.dart';

import '../../../../core/errors/error_model.dart';
import '../../../domain/model/metric_order_model.dart';

part 'mertic_orders_event.dart';
part 'mertic_orders_state.dart';

class MetricOrdersBloc extends Bloc<MetricOrdersEvent, MetricOrdersState> {
  final MetricOrdersUseCase metricUseCase;

  MetricOrdersBloc( this.metricUseCase) : super(MetricOrdersInitial()) {
  on<MetricOrdersEvent>((event, emit) => _handelMetricOrders(event, emit));
  }
  
  _handelMetricOrders(MetricOrdersEvent event, Emitter<MetricOrdersState> emit) async{
   emit(MetricOrdersLoading());
   final result = await metricUseCase.loadOrders();
   result.fold(
   (failure) => emit(MetricOrdersFailure(errorModel: ErrorModel.convertFailureError(failure))), 
   (response) => emit(MetricOrdersSuccess(metricOrder: response)));
  }



}
