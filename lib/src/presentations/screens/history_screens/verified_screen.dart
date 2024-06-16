part of '../screen.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nama event',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '12 Feb 2024',
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  TicketCard(
                    eventImage:
                        'assets/joji.png', // Add your event image asset here
                    eventTitle: 'JOJI',
                    location: 'Jakarta',
                    venue: 'JIS',
                    dateTime: '19.30 WIB\n25 Feb 2024',
                    details: 'Joji\nVIP',
                  ),
                  TicketCard(
                    eventImage:
                        'assets/wave_to_earth.png', // Add your event image asset here
                    eventTitle: 'Wave to Earth',
                    location: 'Jakarta',
                    venue: 'GBK',
                    dateTime: '19.30 WIB\n25 Feb 2024',
                    details: 'Wave to Earth\nVIP',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String eventImage;
  final String eventTitle;
  final String location;
  final String venue;
  final String dateTime;
  final String details;

  const TicketCard({
    super.key,
    required this.eventImage,
    required this.eventTitle,
    required this.location,
    required this.venue,
    required this.dateTime,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("Button clicked!");
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailHistoryScreen()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(eventImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventTitle,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(location),
                    Text(venue),
                    const SizedBox(height: 8),
                    Text(dateTime),
                    Text(details),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.detailHistoryScreen);
                },
                child: const Text('Lihat detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
