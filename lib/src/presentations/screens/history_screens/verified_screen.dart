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
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIconColor: Colors.white,
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
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIconColor: Colors.white,
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
                  TicketCardWidget(
                    bandName: "COLDPLAY",
                    city: "Jakarta",
                    venue: "GBK",
                    time: "19.00 WIB",
                    date: "19 Feb 2024",
                    type: "Regular",
                    colors: Config.buttonColor
                  ),
                  SizedBox(height: 16),
                  TicketCardWidget(
                    bandName: "JKT48",
                    city: "Jakarta",
                    venue: "JIS",
                    time: "19.30 WIB",
                    date: "25 Feb 2024",
                    type: "VIP",
                    colors: Config.buttonColor
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
