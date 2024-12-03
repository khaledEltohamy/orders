


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders/domain/model/graph_order_model.dart';
import 'package:orders/orders/domain/usecase/graph_orders_usecase.dart';

import '../../../../core/errors/error_model.dart';

part 'graph_orders_event.dart';
part 'graph_orders_state.dart';

class GraphOrdersBloc extends Bloc<GraphOrdersEvent, GraphOrdersState> {

  final GraphOrdersUseCase graphUseCase;
  GraphOrdersBloc( this.graphUseCase) : super(GraphOrdersInitial()) {
  on<GraphOrdersEvent>((event, emit) => _handelGraphOrders(event, emit));
  }
  
  _handelGraphOrders(GraphOrdersEvent event, Emitter<GraphOrdersState> emit) async{
   emit(GraphOrdersLoading());
   final result = await graphUseCase.loadOrders();
   result.fold(
   (failure) => emit(GraphOrdersFailure(errorModel: ErrorModel.convertFailureError(failure))), 
   (response) => emit(GraphOrdersSuccess(graphOrder: response)));
  }


}
