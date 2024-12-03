part of 'metric_orders_bloc.dart';

sealed class MetricOrdersEvent extends Equatable {
  const MetricOrdersEvent();

  @override
  List<Object> get props => [];
}

final class GetMetricOrdersEvent extends MetricOrdersEvent {}

