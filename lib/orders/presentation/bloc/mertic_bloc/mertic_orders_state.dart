part of 'metric_orders_bloc.dart';

sealed class MetricOrdersState extends Equatable {
  const MetricOrdersState();
}

final class MetricOrdersInitial extends MetricOrdersState {
  @override
  List<Object> get props => [];
}

final class MetricOrdersLoading extends MetricOrdersState {
  @override
  List<Object> get props => [];
}
final class MetricOrdersSuccess extends MetricOrdersState {
  final MetricOrderModel metricOrder;
  
  const MetricOrdersSuccess({required this.metricOrder});
  
  @override
  List<Object> get props => [metricOrder];
}

final class MetricOrdersFailure extends MetricOrdersState {
  final ErrorModel errorModel;

 const MetricOrdersFailure({required this.errorModel});
  @override
  List<Object> get props => [errorModel];
}

