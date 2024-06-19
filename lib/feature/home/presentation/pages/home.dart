import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/widgets/snackbar.dart';
import 'package:garagewa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:garagewa/feature/home/presentation/widgets/home_page_services.dart';
import 'package:garagewa/feature/home/presentation/widgets/home_page_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () {
        return getUserDetailsandServices();
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is GetServiceFailure) {
            showSnackBar(context, state.message);
          }
          if (state is GetUserDetailsFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Skeletonizer(
            enabled: state is UserDetailsLoading,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  scrolledUnderElevation: 0,
                  pinned: true,
                  elevation: 5,
                  flexibleSpace: SizedBox(
                    height: 100,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        HomePageSlider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Select Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        if (state is GetSeviceSuccess)
                          HomeServices(
                            item: state.services,
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
  }

  Future<void> getUserDetailsandServices() async {
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
