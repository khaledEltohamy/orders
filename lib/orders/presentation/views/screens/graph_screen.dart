import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders/domain/model/graph_order_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../domain/model/chart_model.dart';
import '../../bloc/graph_bloc/graph_orders_bloc.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
    @override
  void initState() {
    super.initState();
    // Lock the orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
    @override
  void dispose() {
    // Unlock the orientation when leaving the screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Order Graph'),
      ),
   body: BlocBuilder<GraphOrdersBloc , GraphOrdersState>(
        builder: (context , state){
          if(state is GraphOrdersLoading){
            return const CircularProgressIndicator();
          }
          if(state is GraphOrdersSuccess){
            return _success(state.graphOrder);
          }
          if(state is GraphOrdersFailure){
            return Text(state.errorModel.contant);
          }else {
            return Container();
          }
      }),
    );
  }
  _success(GraphOrderModel graph){
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: SfCartesianChart(
              
          title: const ChartTitle(text: 'Number of Orders Over Time'),
          zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          zoomMode: ZoomMode.x,
              ),
          primaryXAxis: CategoryAxis(
              title: const AxisTitle(text: 'Time'),
              maximumLabels : graph.orders.length,
              autoScrollingDelta: 10,
              autoScrollingMode: AutoScrollingMode.start,
              labelRotation: 80,
              
            ),
          series:<CartesianSeries<dynamic, dynamic>>[
            StackedLineSeries<ChartData, String>(
              dataSource: graph.charts,
              xValueMapper: (ChartData data, _) => data.date,
              yValueMapper: (ChartData data, _) => data.count,
              markerSettings: const  MarkerSettings(isVisible: true),
            )
          ],
        ),
      );
   
  }
}

