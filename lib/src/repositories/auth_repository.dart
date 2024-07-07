part of 'repository.dart';

class AuthRepository {
  final String baseUrl;

  AuthRepository({
    required this.baseUrl,
  });

  Future<Map<String, dynamic>> signUp(
      String email, String password, String namaPengguna) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/register'),
      body: {
        'email': email,
        'password': password,
        'nama_pengguna': namaPengguna,
      },
    );

    final responseData = _processResponse(response);
    if (kDebugMode) {
      print('Sign Up Response: $responseData');
    }
    return responseData;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (kDebugMode) {
      print(baseUrl);
    }

    final responseData = _processResponse(response);
    if (kDebugMode) {
      print('Sign Up Response: $responseData');
    }
    return responseData;
  }

  Future<User> fetchUserDetails(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/logged'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (kDebugMode) {
        print('Fetch User Details Response: $data');
      }
      return User.fromJson(data);
    } else {
      throw Exception('Failed to fetch user details');
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to communicate with API');
    }
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    if(kDebugMode){
      print(prefs.getString('token'));
    }
    await prefs.remove('token');
  }
}
