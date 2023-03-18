import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/data/enum/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.favorite:
        emit(NavigationState(NavbarItem.favorite, 1));
        break;
      case NavbarItem.search:
        emit(NavigationState(NavbarItem.search, 2));
        break;
    }
  }
}
