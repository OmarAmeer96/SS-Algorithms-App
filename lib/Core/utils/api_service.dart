import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://mohammedsamy.pythonanywhere.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Caesar
  @POST("/caesarEncryption")
  Future<String> encryptCaesar(@Body() Map<String, dynamic> body);

  @POST("/caesarDecryption")
  Future<String> decryptCaesar(@Body() Map<String, dynamic> body);

  // Vigenere
  @POST("/vigenereEncryption")
  Future<String> encryptVigenere(@Body() Map<String, dynamic> body);

  @POST("/vigenereDecryption")
  Future<String> decryptVigenere(@Body() Map<String, dynamic> body);

  // Autokey
  @POST("/autokeyEncryption")
  Future<String> encryptAutokey(@Body() Map<String, dynamic> body);

  @POST("/autokeyDecryption")
  Future<String> decryptAutokey(@Body() Map<String, dynamic> body);

  // Affine
  @POST("/affineEncryption")
  Future<String> encryptAffine(@Body() Map<String, dynamic> body);

  @POST("/affineDecryption")
  Future<String> decryptAffine(@Body() Map<String, dynamic> body);
}
