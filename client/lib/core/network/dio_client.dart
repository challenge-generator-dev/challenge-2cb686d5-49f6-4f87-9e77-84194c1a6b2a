package order_app.core.network;

import 'package:dio/dio.dart';
import 'package:order_app/domain/models/order_request.dart';
import 'package:order_app/domain/models/order_response.dart';
import 'package:order_app/core/constants.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Constants.apiBaseUrl,
            connectTimeout: Constants.connectionTimeout,
            receiveTimeout: Constants.receiveTimeout,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dio.post(
        Constants.ordersEndpoint,
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OrderResponse> getOrder(String id) async {
    try {
      final response = await _dio.get('${Constants.ordersEndpoint}/$id');
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<OrderResponse>> listOrders() async {
    try {
      final response = await _dio.get(Constants.ordersEndpoint);
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => OrderResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    try {
      final response = await _dio.put(
        '${Constants.ordersEndpoint}/$id',
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _dio.delete('${Constants.ordersEndpoint}/$id');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(Constants.timeoutErrorMessage);
      case DioExceptionType.connectionError:
        return NetworkException(Constants.networkErrorMessage);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] as String? ??
            'Error occurred';
        switch (statusCode) {
          case 400:
            return BadRequestException(message);
          case 401:
            return UnauthorizedException(Constants.unauthorizedErrorMessage);
          case 403:
            return ForbiddenException('Access forbidden');
          case 404:
            return NotFoundException(Constants.notFoundErrorMessage);
          case 500:
          case 502:
          case 503:
            return InternalServerErrorException(
                Constants.internalServerErrorMessage);
          default:
            return HttpException(message);
        }
      case DioExceptionType.cancel:
        return RequestCancelledException(Constants.requestCancelledErrorMessage);
      default:
        return HttpException(error.message ?? 'Unknown error occurred');
    }
  }
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);

  @override
  String toString() => 'TimeoutException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);

  @override
  String toString() => 'ForbiddenException: $message';
}

class InternalServerErrorException implements Exception {
  final String message;
  InternalServerErrorException(this.message);

  @override
  String toString() => 'InternalServerErrorException: $message';
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() => 'HttpException: $message';
}

class RequestCancelledException implements Exception {
  final String message;
  RequestCancelledException(this.message);

  @override
  String toString() => 'RequestCancelledException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}