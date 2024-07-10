part of '../screen.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        title: const Text(
          'Semua Event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              size: 35,
              Icons.chevron_left,
              color: Colors.white,
            )),
      ),
    );
  }
}
