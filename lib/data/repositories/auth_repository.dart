import 'dart:convert';

import 'package:http/http.dart';

final AuthRepository authRepository = AuthRepository();

class AuthRepository {

  final Client client = Client();

  final String url = 'http://api.db.pe.kr:51091/api';

  final String tkn = '49D9F99FD50B4AB1A5F6CF64B482C736';

  Future<bool> signIn(String id, String password) async {
    try {
      final body = {
        'mberId': id,
        'mberPassword': password
      };
      final response = await client.post(
        Uri.parse('${url}/authenticate/signin'),
        body: jsonEncode(body),
        headers: {
          'Content-Type' : 'application/json'
        }
      );
      final jsonBody = jsonDecode(response.body);
      return jsonBody['success'];
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<bool> signUp(String id, String password, String name) async {
    final body = {
      'mberId': id,
      'mberPassword': password,
      'mberNm': name
    };
    final response = await client.post(
      Uri.parse('${url}/authenticate/signup'),
      body: body
    );
    try {
      final jsonBody = jsonDecode(response.body);
      return jsonBody['success'];

    } catch(e) {
      return false;
    }
  }

  Future<bool> proAndTar(String gender, String name, double weight, double height, String birth, int step, int water) async {
    try {
      final body = {
        "mberNm": name,
        "sexdstn": gender,
        "height": height,
        "weight": weight,
        "brthdy": birth,
        "stepTarget": step,
        "waterTarget": water
      };
      final response = await client.post(
          Uri.parse('${url}/profile'),
          body: jsonEncode(body),
          headers: {
            'Authorization' : 'Bearer ${tkn}',
            'Content-Type' : 'application/json'
          }
      );
      final jsonBody = jsonDecode(response.body);
      return jsonBody['success'];
    } catch(e) {
      print(e);
      return false;
    }
  }

}