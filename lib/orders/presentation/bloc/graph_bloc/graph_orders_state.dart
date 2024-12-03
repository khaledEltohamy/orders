part of 'graph_orders_bloc.dart';

sealed class GraphOrdersState extends Equatable {
  const GraphOrdersState();
}

final class GraphOrdersInitial extends GraphOrdersState {
  @override
  List<Object> get props => [];
}

final class GraphOrdersLoading extends GraphOrdersState {
  @override
  List<Object> get props => [];
}

final class GraphOrdersSuccess extends GraphOrdersState {
  final GraphOrderModel graphOrder;
  
  const GraphOrdersSuccess({required this.graphOrder});
  
  @override
  List<Object> get props => [graphOrder];
}
final class GraphOrdersFailure extends GraphOrdersState {
  final ErrorModel errorModel;

 const GraphOrdersFailure({required this.errorModel});
  @override
  List<Object> get props => [errorModel];
}

