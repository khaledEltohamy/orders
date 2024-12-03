
import 'order_model.dart';

class MetricOrderModel{
   int? _returnsCount , _totalCount;
   double?  _averagePrice ,_totalPrice;
   final List<OrderModel> orders;

  MetricOrderModel({required this.orders}){
    setTotalCount();
    setReturnsCount();
    setTotalPrice();
    setAveragePrice();
    
  }


   int    get returnsCount => _returnsCount ?? 0;
   int    get totalCount => _totalCount ?? 0;
   double get averagePrice => _averagePrice ?? 0;
   double get totalPrice => _totalPrice ?? 0;

    void  setTotalCount(){
     _totalCount = orders.length;  
     }
  void  setReturnsCount(){
   _returnsCount = orders.where((order) => order.status == "RETURNED").length;
  }

  void  setAveragePrice(){
    // Calculate total price and average price
    int totalCount = orders.length;  

    _averagePrice = totalCount > 0 ? totalPrice / totalCount : 0;
  }  
  void  setTotalPrice(){
    _totalPrice = orders.fold(0, (sum, order) {
      return sum! + double.parse(order.price.replaceAll(RegExp(r'[\$,]'), ''));
    }); 
    
    }



}