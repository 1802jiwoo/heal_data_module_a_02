import 'dart:convert';

import 'package:http/http.dart';

final AuthRepository authRepository = AuthRepository();

class AuthRepository {

  final Client client = Client();

  final String url = 'http://api.db.pe.kr:51091/api';

  Future<bool> signIn(String id, String password) async {
    try {
      print('tlkf1');
      final body = {
        'mberId': id,
        'mberPassword': password
      };
      print('tlkf2');
      final response = await client.post(
        Uri.parse('${url}/authenticate/signin'),
        body: jsonEncode(body),
        headers: {
          'Content-Type' : 'application/json'
        }
      );
      print('tlkf3');
      final jsonBody = jsonDecode(response.body);
      return jsonBody['success'];
    } catch(e) {
      print('tlkf');
      return false;
    }
  }

  Future<String> signUp() async {
    return 'a';
  }

}