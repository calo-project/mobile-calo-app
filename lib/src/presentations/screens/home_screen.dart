// ignore_for_file: library_private_types_in_public_api

part of 'screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeDataLoaded) {
          final destinations = [
            getIcon('assets/icons/home-icon.svg', false),
            getIcon('assets/icons/ticket-icon.svg', false),
            getIcon('assets/icons/history-icon.svg', false),
            getIcon('assets/icons/profile-icon.svg', false),
          ];

          final selectedDestinations = [
            getIcon('assets/icons/home-icon.svg', true),
            getIcon('assets/icons/ticket-icon.svg', true),
            getIcon('assets/icons/history-icon.svg', true),
            getIcon('assets/icons/profile-icon.svg', true),
          ];

          final labels = ['Beranda', 'Event', 'Riwayat', 'Profil'];

          return Scaffold(
            backgroundColor: Config.primaryColor,
            body: [
              const HomeFragment(),
              const EventFragment(),
              const HistoryFragment(),
              const ProfileFragment(),
            ][state.selectedIndex],
            bottomNavigationBar: CaloNavigationBar(
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              destinations: List.generate(
                4,
                (index) => CaloNavigationDestination(
                  icon: destinations[index].icon,
                  selectedIcon: selectedDestinations[index].icon,
                  label: labels[index],
                  labelColor: destinations[index].color,
                  selectedLabelColor: selectedDestinations[index].color,
                ),
              ),
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) =>
                  MyApp.homeBloc.add(SetHomeSelectedIndex(index: index)),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class IconWithColor {
  final Widget icon;
  final Color color;

  IconWithColor(this.icon, this.color);
}

IconWithColor getIcon(String assetName, bool isSelected) {
  final color = isSelected ? Config.iconColor : Config.fontSecunderColor;
  return IconWithColor(
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SvgPicture.asset(
        assetName,
        width: 25,
        height: 25,
        color: color,
      ),
    ),
    color,
  );
}
