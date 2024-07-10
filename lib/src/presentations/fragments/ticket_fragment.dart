part of 'fragment.dart';

class TicketFragment extends StatefulWidget {
  const TicketFragment({super.key});

  @override
  State<TicketFragment> createState() => _TicketFragmentState();
}

class _TicketFragmentState extends State<TicketFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        title: const Text(
          'Tiket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const EventTicketPage(),
    );
  }
}

class EventTicketPage extends StatefulWidget {
  const EventTicketPage({super.key});

  @override
  _EventTicketPageState createState() => _EventTicketPageState();
}

class _EventTicketPageState extends State<EventTicketPage> {
  final List<Map<String, String>> dates = [
    {'date': '18', 'day': 'Senin'},
    {'date': '19', 'day': 'Selasa'},
    {'date': '20', 'day': 'Rabu'},
    {'date': '21', 'day': 'Kamis'},
    {'date': '22', 'day': 'Jumat'},
    {'date': '23', 'day': 'Sabtu'},
    {'date': '24', 'day': 'Minggu'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dateSelector(),
        const Margin(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Kategori Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Margin(),
        categoryConcertChips(),
        const SizedBox(
          height: 10,
        ),
        categoryShowChips(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: chipWidget('Semua Event'),
          ),
        ),
        const Margin(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Semua Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Margin(),
        SizedBox(
          height: 275,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detailEventScreen);
                  },
                  child: const EventCard(
                    imageUrl:
                        'https://miro.medium.com/v2/resize:fit:800/1*FWMTpgD_WMu-roVdHiInJA.jpeg',
                    eventName: 'BILLIE EILISH',
                    eventLocation: 'di Jakarta, Indonesia',
                    eventDate: '11 Oct 2024 - 19:00',
                  ),
                ),
              );
            },
          ),
        ),
        const Margin(),
        SizedBox(
          height: 275,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detailEventScreen);
                  },
                  child: const EventCard(
                    imageUrl:
                        'https://miro.medium.com/v2/resize:fit:800/1*FWMTpgD_WMu-roVdHiInJA.jpeg',
                    eventName: 'BILLIE EILISH',
                    eventLocation: 'di Jakarta, Indonesia',
                    eventDate: '11 Oct 2024 - 19:00',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget dateSelector() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15.0 : 0.0),
            child: dateChip(
              dates[index]['date']!,
              dates[index]['day']!,
              isSelected: index == 1,
            ),
          );
        },
      ),
    );
  }

  Widget dateChip(String date, String day, {bool isSelected = false}) {
    return Container(
      width: 60,
      height: 70,
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple : Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 20,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryShowChips() {
    List<String> chipLabels = ['Talk Show', 'Seminar', 'PodTalk', 'Stand Up'];

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15.0 : 10.0),
            child: chipWidget(chipLabels[index]),
          );
        },
      ),
    );
  }

  Widget categoryConcertChips() {
    List<String> chipLabels = [
      'Pop',
      'Dangdut',
      'DJ',
      'Jazz',
      'Rock',
    ];

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15.0 : 10.0),
            child: chipWidget(chipLabels[index]),
          );
        },
      ),
    );
  }

  Widget chipWidget(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.grey[900],
      labelStyle: const TextStyle(color: Colors.white),
      side: const BorderSide(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }

  Widget eventCard(String title, String location, String date, String time) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network('https://via.placeholder.com/150',
              fit: BoxFit.cover),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text('$location\n$date - $time',
            style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
