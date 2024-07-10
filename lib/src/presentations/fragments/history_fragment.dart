part of 'fragment.dart';

class HistoryFragment extends StatefulWidget {
  const HistoryFragment({super.key});

  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      // TODO? idk?
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.primaryColor,
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 6,
          indicatorColor:
              _tabController.index == 1 ? Config.buttonColor : Colors.yellow,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabs: const [
            Tab(text: 'Belum diverifikasi'),
            Tab(text: 'Sudah diverifikasi'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          NotVerifiedScreen(),
          VerifiedScreen(),
        ],
      ),
    );
  }
}
