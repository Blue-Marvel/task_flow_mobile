import 'dart:convert';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

// final authProvider =
//     Provider<UserModel>((ref) => UserModel.fromData(AuthService.userData!));

class AuthService {
  // static Map<String, dynamic> userData = {};
  static Future<String> userSignupUser({
    required Map<String, dynamic> signupData,
  }) async {
    String res = 'Some error occured';
    final urlName = SIGN_UP_API;
    final header = {
      "Content-Type": "application/json",
    };
    try {
      final url = Uri.parse(urlName);
      final response =
          await http.post(url, body: json.encode(signupData), headers: header);
      final responseData = await json.decode(response.body);
      print(response.statusCode);
      // userData = responseData['data'];
      if (response.statusCode == 201) {
        res = "success";
        print(responseData);
        // print(response.body);
        return res;
      }
      return res;
    } catch (e) {
      res = e.toString();
      rethrow;
    }
  }
}
