import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/theme/pallet.dart';
import 'package:garagewa/feature/home/presentation/bloc/home_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetUserDetailsSuccess) {
            return Column(
              children: [Text("${state.userDetails.firstName}")],
            );
          }
          return ListView(
            children: [
              Container(),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.account_circle_outlined,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("My Profile"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: AppPallet.primaryColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/address');
                },
                tileColor: Colors.white,
                title: const Text("My Addresses"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: AppPallet.primaryColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/features');
                },
                tileColor: Colors.white,
                title: const Text("Additional Features"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.directions_car_outlined,
                  color: AppPallet.primaryColor,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/myCars');
                },
                tileColor: Colors.white,
                title: const Text("My Cars"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.emoji_events,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("My Reward"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/orders');
                },
                leading: const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("My Orders"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/changePassword');
                },
                leading: const Icon(
                  Icons.password,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("Change password"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/deleteAccount');
                },
                leading: const Icon(
                  Icons.delete_outline,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("Delete Account"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.logout,
                  color: AppPallet.primaryColor,
                ),
                tileColor: Colors.white,
                title: const Text("Log Out"),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
