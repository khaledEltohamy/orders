import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders/domain/model/metric_order_model.dart';
import 'package:orders/orders/presentation/bloc/mertic_bloc/metric_orders_bloc.dart';
import 'package:orders/orders/presentation/views/screens/graph_screen.dart';
import 'package:orders/orders/presentation/views/widgets/metric_card.dart';


class MetricScreen extends StatefulWidget {
  const MetricScreen({super.key});

  @override
  State<MetricScreen> createState() => _MetricScreenState();
}

class _MetricScreenState extends State<MetricScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Metrics'),
      ),
      body: BlocBuilder<MetricOrdersBloc , MetricOrdersState>(
        builder: (context , state){
          if(state is MetricOrdersLoading){
            return const CircularProgressIndicator();
          }
          if(state is MetricOrdersSuccess){
            return _success(state.metricOrder);
          }
          if(state is MetricOrdersFailure){
            return Text(state.errorModel.contant);
          }else {
            return Container();
          }
      }),
    );
  }

  _success(MetricOrderModel metric){
   return Center(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2 ,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8, 
          children: [     
            MetricCard(title: "Total Orders", value: "${metric.totalCount}"),
            MetricCard(title: "Average Price", value: metric.averagePrice.toStringAsFixed(2)),
            MetricCard(title: "Number of Returns", value: "${metric.returnsCount}"),
            InkWell(
              onTap: () {
                  // Navigate to the graph screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GraphScreen(),
                      ),
                    );
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 210, 210),
                    borderRadius: BorderRadius.circular(16), 
                  ),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('View Order Graph' ,
                      style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                         )),
                      Icon(Icons.auto_graph , size: 55, color: Colors.blueAccent)
                    ],),
                  ),
                ),
            ),
          ],),

        ),
    );
  }
}