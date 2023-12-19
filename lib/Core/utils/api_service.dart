import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://mohammedsamy.pythonanywhere.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/caesarEncryption")
  Future<String> encryptCaesar(@Body() Map<String, dynamic> body);

  @POST("/caesarDecryption")
  Future<String> decryptCaesar(@Body() Map<String, dynamic> body);
}
