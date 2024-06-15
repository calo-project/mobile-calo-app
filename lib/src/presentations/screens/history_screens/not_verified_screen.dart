part of '../screen.dart';

class NotVerifiedScreen extends StatelessWidget {
  const NotVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TicketCardWidget(
            bandName: "COLDPLAY",
            city: "Jakarta",
            venue: "GBK",
            time: "19.00 WIB",
            date: "19 Feb 2024",
            type: "Regular",
          ),
          SizedBox(height: 16),
          TicketCardWidget(
            bandName: "JKT48",
            city: "Jakarta",
            venue: "JIS",
            time: "19.30 WIB",
            date: "25 Feb 2024",
            type: "VIP",
          ),
        ],
      ),
    );
  }
}
