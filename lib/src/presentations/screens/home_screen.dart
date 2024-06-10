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
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.purple : Colors.blue[300]),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number, color: _selectedIndex == 1 ? Colors.purple : Colors.blue[300]),
              label: 'Tiket',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: _selectedIndex == 2 ? Colors.purple : Colors.blue[300]),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _selectedIndex == 3 ? Colors.purple : Colors.blue[300]),
              label: 'Akun',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.blue[300],
          onTap: _onItemTapped,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
