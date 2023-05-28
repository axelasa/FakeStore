import 'package:fake_store/bloc/get_all_cart_bloc.dart';
import 'package:fake_store/screens/all_products/all_products.dart';
import 'package:fake_store/screens/cart/get_cart.dart';
import 'package:fake_store/screens/profile/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const AllProducts();
    switch(_selectedIndex){
      case 0:
        currentWidgetPage = const AllProducts();
        break;
      case 1:
        currentWidgetPage = const Account();
        break;
      case 2:
        BlocProvider.of<GetAllCartBloc>(context).add(GetAllCartInfo());
        currentWidgetPage = const GetCart();
        break;
    }
    return  Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            gap: 10,
              color: Colors.black,
              activeColor: Colors.grey[800],
              tabBackgroundColor: Colors.white12,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: CupertinoIcons.profile_circled,
                  text: 'Account',
                ),
                GButton(icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
                // GButton(icon: Icons.settings,
                //   text: 'Settings',
                // ),
              ],
          ),
        ),
      ),
      body: currentWidgetPage,
    );
  }
}
