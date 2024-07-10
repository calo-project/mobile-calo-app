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
            Icons.chevron_left,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
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
                        prefixIcon: const Icon(Icons.calendar_today,
                            color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 420,
                child: ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detailEventScreen);
                    },
                    child: const RecommendationCard(
                      imageUrl:
                          'https://img.jakpost.net/c/2019/07/11/2019_07_11_76116_1562816477._large.jpg',
                      eventName: 'Taylor Swift: The Eras Tour',
                      eventLocation: 'Surabaya, Indonesia',
                      eventDate: '19 Feb 2024',
                    ),
                  ),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              SizedBox(
                height: 420,
                child: ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detailEventScreen);
                    },
                    child: const RecommendationCard(
                      imageUrl:
                          'https://img.jakpost.net/c/2019/07/11/2019_07_11_76116_1562816477._large.jpg',
                      eventName: 'Taylor Swift: The Eras Tour',
                      eventLocation: 'Surabaya, Indonesia',
                      eventDate: '19 Feb 2024',
                    ),
                  ),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
