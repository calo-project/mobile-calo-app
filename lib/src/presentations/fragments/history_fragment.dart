part of 'fragment.dart';

class HistoryFragment extends StatelessWidget {
  const HistoryFragment({super.key});
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Config.primaryColor,
          title: const Text('Riwayat', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(
            dividerColor: Config.primaryColor,
            indicatorWeight: 6,
            indicatorColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            tabs: ['Belum diverifikasi', 'Sudah diverifikasi']
                .map((e) => Tab(text: e))
                .toList(),
          ),
        ),
        body: const TabBarView(children: [
          NotVerifiedScreen(),
          VerifiedScreen(),
        ]),
      ),
    );
  }
}
