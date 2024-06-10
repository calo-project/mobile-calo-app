// ignore_for_file: library_private_types_in_public_api

part of 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<String> _widgetRoutes = <String>[
    Routes.homeFragment,
    Routes.ticketFragment,
    Routes.historyFragment,
    Routes.profileFragment,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getIcon(String assetName, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SvgPicture.asset(
        width: 20,
        height: 20,
        assetName,
        // ignore: deprecated_member_use
        color: isSelected ? Config.iconColor : Config.fontSecunderColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          return Routes.generateRoute(
            RouteSettings(
              name: _widgetRoutes[_selectedIndex],
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 1,
          backgroundColor: Config.primaryColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _getIcon('assets/icons/home-icon.svg', _selectedIndex == 0),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: _getIcon('assets/icons/ticket-icon.svg', _selectedIndex == 1),
              label: 'Tiket',
            ),
            BottomNavigationBarItem(
              icon: _getIcon('assets/icons/history-icon.svg', _selectedIndex == 2),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: _getIcon('assets/icons/profile-icon.svg', _selectedIndex == 3),
              label: 'Akun',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Config.iconColor,
          unselectedItemColor: Config.fontSecunderColor,
          onTap: _onItemTapped,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
