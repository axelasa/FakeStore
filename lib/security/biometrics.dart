import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometrics extends StatefulWidget {
  const Biometrics({Key? key}) : super(key: key);

  @override
  State<Biometrics> createState() => _BiometricsState();
}

class _BiometricsState extends State<Biometrics> {
  late final LocalAuthentication auth;
  bool _supportState = true;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState((){
      _supportState = isSupported;
    }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(_supportState)
            const Text('This device is supported')
          else
            const Text('This device is not supported'),
          // const Divider(
          //   height: 10,
          // ),
          // ElevatedButton(
          //     onPressed: _authenticate,
          //    child: const Text(
          //   'Get Available Biometrics'
          // ),
          // ),
          const Divider(height: 3,),

          ElevatedButton(onPressed: _authenticate,
              child: const Text('Authenticated'),
          )
        ],
      ),
    );
  }

  Future<void> _authenticate() async{
    try{
      bool authenticated = await auth.authenticate(
          localizedReason: 'protect your shopping information',
          options: const AuthenticationOptions(
              stickyAuth: true,
              biometricOnly: false
          )
      );
      if (kDebugMode) {
        print('Authenticated : $authenticated');
      }
    }on PlatformException catch(e){
      if (kDebugMode) {
        print(e.message);
      }
    }

    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    if (kDebugMode) {
      print('List of Available Biometrics: $availableBiometrics');
    }

    if(!mounted){
      return;
    }
  }
}
