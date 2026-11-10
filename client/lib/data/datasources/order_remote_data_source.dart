import 'package:dio/dio.dart';
import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../domain/models/order_request.dart';
import '../../domain/models/order_response.dart';

class OrderRemoteDataSource {
  final DioClient _dioClient;

  OrderRemoteDataSource({required DioClient dioClient}) : _dioClient = dioClient;

  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dioClient.post(
        Constants.ordersEndpoint,
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<OrderResponse> getOrder(String id) async {
    try {
      final response = await _dioClient.get('${Constants.ordersEndpoint}/$id');
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<List<OrderResponse>> listOrders() async {
    try {
      final response = await _dioClient.get(Constants.ordersEndpoint);
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => OrderResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    try {
      final response = await _dioClient.put(
        '${Constants.ordersEndpoint}/$id',
        data: orderRequest.toJson(),
      );
      return OrderResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<void> deleteOrder(String id) async {
    try {
      await _dioClient.delete('${Constants.ordersEndpoint}/$id');
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = error.response?.data?['message'] as String? ?? 
        error.message ?? 
        'Unknown error occurred';

    switch (statusCode) {
      case 400:
        throw BadRequestException(message);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 500:
        throw InternalServerErrorException(message);
      default:
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          throw TimeoutException(message);
        } else if (error.type == DioExceptionType.cancel) {
          throw RequestCancelledException(message);
        } else if (error.type == DioExceptionType.connectionError) {
          throw NetworkException(message);
        }
        throw HttpException(message);
    }
  }
}