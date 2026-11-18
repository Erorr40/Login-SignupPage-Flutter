import 'package:dio/dio.dart';
import 'package:signuploginpages/Models/auth_model.dart';

class AuthService {
  static Dio dio = Dio();

  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {
          "Email": email,
          "Password": password,
        },
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherError) {
      throw Exception("Other Error: ${otherError.toString()}");
    }
  }

  static Future<AuthModel> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": name,
          "Email": email,
          "Phone": phone,
          "Password": password,
        },
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherError) {
      throw Exception("Other Error: ${otherError.toString()}");
    }
  }
}
