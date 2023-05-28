import 'package:flutter/material.dart';

import '../../security/biometrics.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int _creditScore = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _creditScore +=1;
            });
          },
        backgroundColor: Colors.grey,
          child: const Icon(Icons.add),
          ),
      
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/yamamoto.jpg'),
                radius: 100,
              ),
            ),
            Divider(
              height: 10,
              color: Colors.grey[800],
            ),
            const SizedBox(height: 12,),
             Row(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('Name :',
                    style:TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('Genryusai Shigekuni Yamamoto',
                    style:TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(

              children: [
                 Text('Credit Score: ',
                  style:TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                ),

                Text(' $_creditScore',
                  style:TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12,),

            Row(
              children:  [
                Icon(
                  Icons.email,
                  color: Colors.grey[800],
                ),
                const SizedBox(width: 10),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'GenryusaiYamamoto@gmail.com',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Flexible(child: Biometrics())
          ],
        ),
      ),
    );
  }
}


