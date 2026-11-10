import 'package:order_app/domain/entities/order.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';

/// Interfaz del repositorio de órdenes.
/// Define los contratos que deben implementarse para gestionar órdenes.
abstract class OrderRepository {
  /// Crea una nueva orden.
  /// [orderRequest]: Datos de la orden a crear.
  /// Retorna [OrderResponse] con los detalles de la orden creada.
  /// Lanza excepciones en caso de error de red o validación.
  Future<OrderResponse> createOrder(OrderRequest orderRequest);

  /// Obtiene los detalles de una orden por su ID.
  /// [id]: Identificador de la orden.
  /// Retorna [OrderResponse] con los detalles de la orden.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<OrderResponse> getOrder(String id);

  /// Lista todas las órdenes.
  /// Retorna una lista de [OrderResponse].
  /// Lanza excepciones en caso de error de red.
  Future<List<OrderResponse>> listOrders();

  /// Actualiza una orden existente.
  /// [id]: Identificador de la orden.
  /// [orderRequest]: Datos actualizados de la orden.
  /// Retorna [OrderResponse] con los detalles actualizados.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest);

  /// Elimina una orden por su ID.
  /// [id]: Identificador de la orden.
  /// Lanza [NotFoundException] si la orden no existe.
  Future<void> deleteOrder(String id);
}