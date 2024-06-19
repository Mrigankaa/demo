import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/theme/pallet.dart';
import 'package:garagewa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:garagewa/feature/home/presentation/pages/home.dart';
import 'package:garagewa/feature/home/presentation/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    getUserDetailsandServices();
  }

  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Home(),
          Home(),
          Home(),
          Profile(),
          Home(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        selectedItemColor: AppPallet.primaryColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        elevation: 5,
        currentIndex: _currentIndex,
        onTap: (val) {
          _onItemTapped(val);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
              label: "Cart", icon: Icon(Icons.shopping_cart_outlined)),
          BottomNavigationBarItem(
            label: "Book Driver",
            icon: Icon(
              Icons.cell_tower_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Acount",
            icon: Icon(
              Icons.person_outline,
            ),
          ),
          BottomNavigationBarItem(
            label: "Notifiction",
            icon: Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  void getUserDetailsandServices() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('userId');
    context.read<HomeBloc>().add(
          GetUserDetailsBloc(userId: userId!),
        );
    context.read<HomeBloc>().add(
          GetServicesBloc(),
        );
  }
}
