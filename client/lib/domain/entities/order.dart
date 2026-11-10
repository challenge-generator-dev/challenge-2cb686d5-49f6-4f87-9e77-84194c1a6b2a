part of 'order.freezed.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// Entidad que representa una orden en el dominio.
/// Contiene todos los atributos necesarios para gestionar órdenes.
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String customerId,
    required List<OrderItem> items,
    required DateTime createdAt,
    required OrderStatus status,
    DateTime? updatedAt,
    String? notes,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

/// Representa un item dentro de una orden.
@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required int quantity,
    required double price,
    String? description,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

/// Estados posibles de una orden.
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}