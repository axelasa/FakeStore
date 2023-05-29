import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Padding(padding:
        const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/account');
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/yamamoto.jpg',
                    ),
                    radius: 25,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:10.0,left: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Hi, Yamamoto",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
