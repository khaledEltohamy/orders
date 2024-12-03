part of 'graph_orders_bloc.dart';

sealed class GraphOrdersEvent extends Equatable {
  const GraphOrdersEvent();

  @override
  List<Object> get props => [];
}

final class GetGraphOrdersEvent extends GraphOrdersEvent {}