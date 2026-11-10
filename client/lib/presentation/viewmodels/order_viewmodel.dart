package order_app.presentation.viewmodels;

import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/core/constants.dart';
import 'package:order_app/core/network/dio_client.dart';

class OrderViewModel extends ValueNotifier<OrderViewModelState> {
  final OrderRepository _repository;
  
  OrderViewModel(this._repository) : super(const OrderViewModelState()) {
    loadOrders();
  }

  List<OrderResponse> get orders => state.orders;
  bool get isLoading => state.isLoading;
  String? get errorMessage => state.errorMessage;
  OrderResponse? get selectedOrder => state.selectedOrder;

  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await _repository.listOrders();
      state = state.copyWith(
        orders: result,
        isLoading: false,
        errorMessage: null,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout cargando pedidos: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido cargando pedidos: $e');
    }
  }

  Future<void> createOrder(OrderRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final createdOrder = await _repository.createOrder(request);
      final updatedOrders = [...state.orders, createdOrder];
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout creando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido creando pedido: $e');
    }
  }

  Future<void> updateOrder(String id, OrderRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final updatedOrder = await _repository.updateOrder(id, request);
      final updatedOrders = state.orders.map((order) {
        return order.id == id ? updatedOrder : order;
      }).toList();
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
        selectedOrder: state.selectedOrder?.id == id ? updatedOrder : state.selectedOrder,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout actualizando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido actualizando pedido: $e');
    }
  }

  Future<void> deleteOrder(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _repository.deleteOrder(id);
      final updatedOrders = state.orders.where((order) => order.id != id).toList();
      state = state.copyWith(
        orders: updatedOrders,
        isLoading: false,
        errorMessage: null,
        selectedOrder: state.selectedOrder?.id == id ? null : state.selectedOrder,
      );
    } on TimeoutException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.timeoutErrorMessage,
      );
      debugPrint('Timeout eliminando pedido: ${e.message}');
    } on NotFoundException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.notFoundErrorMessage,
      );
      debugPrint('Recurso no encontrado: ${e.message}');
    } on BadRequestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${Constants.badRequestErrorMessage}: ${e.message}',
      );
      debugPrint('Solicitud incorrecta: ${e.message}');
    } on UnauthorizedException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.unauthorizedErrorMessage,
      );
      debugPrint('No autorizado: ${e.message}');
    } on ForbiddenException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Acceso prohibido: ${e.message}',
      );
      debugPrint('Acceso prohibido: ${e.message}');
    } on InternalServerErrorException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.internalServerErrorMessage,
      );
      debugPrint('Error del servidor: ${e.message}');
    } on RequestCancelledException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.requestCancelledErrorMessage,
      );
      debugPrint('Solicitud cancelada: ${e.message}');
    } on NetworkException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: Constants.networkErrorMessage,
      );
      debugPrint('Error de red: ${e.message}');
    } on HttpException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      debugPrint('Error HTTP: ${e.message}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error desconocido: ${e.toString()}',
      );
      debugPrint('Error desconocido eliminando pedido: $e');
    }
  }

  void selectOrder(String id) {
    final order = state.orders.firstWhere(
      (o) => o.id == id,
      orElse: () => state.orders.first,
    );
    state = state.copyWith(selectedOrder: order);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void clearSelection() {
    state = state.copyWith(selectedOrder: null);
  }
}

class OrderViewModelState {
  final List<OrderResponse> orders;
  final bool isLoading;
  final String? errorMessage;
  final OrderResponse? selectedOrder;

  const OrderViewModelState({
    this.orders = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedOrder,
  });

  OrderViewModelState copyWith({
    List<OrderResponse>? orders,
    bool? isLoading,
    String? errorMessage,
    OrderResponse? selectedOrder,
  }) {
    return OrderViewModelState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedOrder: selectedOrder ?? this.selectedOrder,
    );
  }
}

final orderViewModelProvider = StateNotifierProvider<OrderViewModel, OrderViewModelState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderViewModel(repository);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('El provider de OrderRepository debe ser sobreescrito en el módulo de inyección');
});