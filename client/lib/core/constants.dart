/// Constantes globales de la aplicación.
class Constants {
  /// URL base de la API del backend.
  static const String apiBaseUrl = 'http://localhost:8080';

  /// Endpoints de la API.
  static const String ordersEndpoint = '/orders';

  /// Tiempos de espera para las peticiones HTTP.
  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Mensajes de error comunes.
  static const String networkErrorMessage = 'Error de red. Verifica tu conexión.';
  static const String timeoutErrorMessage = 'Tiempo de espera agotado.';
  static const String unauthorizedErrorMessage = 'No autorizado. Verifica tus credenciales.';
  static const String notFoundErrorMessage = 'Recurso no encontrado.';
  static const String badRequestErrorMessage = 'Solicitud incorrecta.';
  static const String internalServerErrorMessage = 'Error interno del servidor.';
  static const String requestCancelledErrorMessage = 'Solicitud cancelada.';
}