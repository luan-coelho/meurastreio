import 'package:dio/dio.dart';
import 'package:meurastreio/models/order.dart';

class OrderService {
  final Dio _dio = Dio();
  final String _baseUrl = "http://10.0.2.2:3000";

  Future<List<Order>> getAllOrders() async {
    try {
      final response = await _dio.get('$_baseUrl/orders');
      return (response.data as List)
          .map((json) => Order.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar encomendas: $e');
    }
  }

  Future<Order> getOrderById(String id) async {
    try {
      final response = await _dio.get('$_baseUrl/orders/$id');
      return Order.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar encomenda: $e');
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      await _dio.post('$_baseUrl/orders', data: order.toJson());
    } catch (e) {
      throw Exception('Erro ao criar encomenda: $e');
    }
  }

  Future<void> updateOrder(String id, Order order) async {
    try {
      await _dio.put('$_baseUrl/orders/$id', data: order.toJson());
    } catch (e) {
      throw Exception('Erro ao atualizar encomenda: $e');
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _dio.delete('$_baseUrl/orders/$id');
    } catch (e) {
      throw Exception('Erro ao excluir encomenda: $e');
    }
  }
}
