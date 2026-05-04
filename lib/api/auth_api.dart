import '../utility/htify.dart';

class AuthApi {
  final NetworkService _api;

  AuthApi(this._api);

  // 🔐 Login
  Future login(Map<String, dynamic> data) async {
    return await _api.post('/api/auth/send-otp/', data);
  }

  // 🔐 Login Verify
  Future loginVerify(Map<String, dynamic> data) async {
    return await _api.post('/api/auth/verify-otp/', data);
  }

  // 🚪 Logout
  Future logout() async {
    return await _api.get('auth/logout/customer');
  }

  // 👤 Get User
  Future getUser(String id) async {
    return await _api.get('/api/user/$id/');
  }

  // 📝 Signup step 1
  Future signupStep1(Map<String, dynamic> data) async {
    return await _api.post('/api/notification/register/', data);
  }

  // 📝 Signup step 2
  Future signupStep2(Map<String, dynamic> data) async {
    return await _api.post('auth/email/verify/register', data);
  }

  // 🔁 Forgot password step 1
  Future forgotStep1(String email) async {
    return await _api.post(
      'auth/forget/email',
      {'email': email},
    );
  }

  // 🔁 Forgot password step 2
  Future forgotStep2(Map<String, dynamic> data) async {
    return await _api.post('auth/forget/token', data);
  }

  // 🔁 Forgot password step 3
  Future forgotStep3(Map<String, dynamic> data) async {
    return await _api.post('auth/forget/login', data);
  }

  // 🌍 Cities
  Future getCities(int? provinceId) async {
    return await _api.post(
      'site/city',
      {'parent_id': provinceId},
    );
  }

  // 🌍 Provinces
  Future getProvinces() async {
    return await _api.post('site/city', {});
  }
}