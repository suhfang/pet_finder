

import 'dart:convert';

import 'package:http/http.dart';
import 'package:pet_finder/data/models/animal.dart';

class NetworkService {

  final baseUrl = 'api.petfinder.com';

  Future<Map<String, dynamic>?> authenticate() async {
    try {
      final response = await get(
          Uri.https(baseUrl, '/v2/oauth2/token', {
            'grant_type': 'client_credentials',
            'client_id': 'AC6oFpcdasi8x0578KCbnJBm3KKfmXwRFxPr3VzzU2gkQ1nj9D',
            'client_secret': 'uc9dH8d1LgYoPL9u6UQVy53fcej9twXxMf3EoJ40'
          })
      );
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<List<Animal>?> fetchAnimalsWith({required String searchQuery}) async {
    try {
      final response = await authenticate().then((authData) {
        if (authData != null) {
          String accessToken = authData['access_token'];
        }
      });
    } catch (e) {
      return null;
    }
  }
}