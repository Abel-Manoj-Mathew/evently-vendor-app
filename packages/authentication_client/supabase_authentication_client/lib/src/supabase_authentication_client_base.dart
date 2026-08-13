import 'package:authentication_client/authentication_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthenticationClient implements AuthenticationClient {
  const SupabaseAuthenticationClient({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  @override
  Future<void> signInWithOtp({required String phone}) async {
    await supabaseClient.auth.signInWithOtp(phone: phone);
  }

  @override
  Future<void> verifyOtp({required String phone, required String token}) async {
    await supabaseClient.auth.verifyOTP(
      phone: phone,
      token: token,
      type: OtpType.sms,
    );
  }
}
