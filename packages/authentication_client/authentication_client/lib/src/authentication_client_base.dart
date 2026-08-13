abstract class AuthenticationClient {
  Future<void> signInWithOtp({required String phone});
  Future<void> verifyOtp({required String phone, required String token});
}
