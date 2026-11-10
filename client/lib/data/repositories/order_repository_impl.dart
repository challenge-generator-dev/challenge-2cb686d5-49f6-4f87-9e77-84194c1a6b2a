import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../domain/models/order_request.dart';
import '../../domain/models/order_response.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl({required DioClient dioClient})
      : _remoteDataSource = OrderRemoteDataSource(dioClient: dioClient);

  @override
  Future<OrderResponse> createOrder(OrderRequest orderRequest) async {
    return await _remoteDataSource.createOrder(orderRequest);
  }

  @override
  Future<OrderResponse> getOrder(String id) async {
    return await _remoteDataSource.getOrder(id);
  }

  @override
  Future<List<OrderResponse>> listOrders() async {
    return await _remoteDataSource.listOrders();
  }

  @override
  Future<OrderResponse> updateOrder(String id, OrderRequest orderRequest) async {
    return await _remoteDataSource.updateOrder(id, orderRequest);
  }

  @override
  Future<void> deleteOrder(String id) async {
    await _remoteDataSource.deleteOrder(id);
  }
}