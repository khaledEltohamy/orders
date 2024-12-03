import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/orders/presentation/bloc/graph_bloc/graph_orders_bloc.dart';
import 'package:orders/orders/presentation/bloc/mertic_bloc/metric_orders_bloc.dart';
import 'package:orders/orders/presentation/views/screens/metric_screen.dart';

import 'core/injection/injection_app.dart'as di;

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await di.initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
     BlocProvider(create: (context) => di.getIt<MetricOrdersBloc>()..add(GetMetricOrdersEvent())),
       BlocProvider(create: (context) => di.getIt<GraphOrdersBloc>()..add(GetGraphOrdersEvent()))
    ]
    
    , child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const MetricScreen(),
    )
  
  );
    
    
    
  
  
  }
}
