part of '../screen.dart';

class SearchEventScreen extends StatelessWidget {
  const SearchEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        title: const Text(
          'Cari Event',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchEventScreen()),
                  );
                },

                // TODO
                style: Config.textStyleTitleSmall.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                  hintStyle:
                      Config.textStyleTitleSmall.copyWith(color: Colors.white),
                  hintText: 'Cari disini, yuk!',
                  iconColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Config.greyColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
