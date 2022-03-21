import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  BiometricHelper._();

  static final localAuth = LocalAuthentication();

  static Future<bool> checkFingerPrintExists() async {
    final auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return true;
      }
    }
    return false;
  }

  static Future<bool> doAuthenticate() async {
    var localAuth = LocalAuthentication();
    return await localAuth.authenticate(
      localizedReason: "Authenticate to access to your account",
      biometricOnly: true,
    );
  }
}
