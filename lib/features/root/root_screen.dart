import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/data/enum/nav_bar_items.dart';
import 'package:peliculas/features/favorite/home_screen.dart';

import 'package:peliculas/features/home/home_screen.dart';
import 'package:peliculas/features/root/navigation_bloc/navigation_cubit.dart';
import 'package:peliculas/features/serch/search_screen.dart';
import 'package:peliculas/resources/colors.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: AppColors.black2,
            // fixedColor: Colors.red,
            currentIndex: state.index,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconHomeEmpty,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.iconHome,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconFavoriteEmpty,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.icoFavorite,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconSearchEmpty,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.iconSearh,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.favorite);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.search);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const HomeScreen();
        } else if (state.navbarItem == NavbarItem.favorite) {
          return const FavoriteScreen();
        } else if (state.navbarItem == NavbarItem.search) {
          return const SearchScreen();
        }
        return Container();
      }),
    );
  }
}
