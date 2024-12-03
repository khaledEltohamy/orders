import 'package:intl/intl.dart';

import 'chart_model.dart';
import 'order_model.dart';

class GraphOrderModel {
  List<ChartData>? _charts;
  final List<OrderModel> orders;

  GraphOrderModel({required this.orders}){
    setCharts();
  }


  get charts => _charts ?? [];

  void setCharts(){
     // Prepare data for the graph
    Map<DateTime, int> orderCountByDate = {};

    for (var order in orders) {
      DateTime date = DateTime(order.registered.year, order.registered.month, order.registered.day);

      orderCountByDate[date] = (orderCountByDate[date] ?? 0) + 1;
    }
    
    // Convert the map to a list of ChartData
    _charts = orderCountByDate.entries.map((entry) {
     String formattedDate = DateFormat.Md().format(entry.key);
      return ChartData(formattedDate, entry.value);
    }).toList();
  }

}