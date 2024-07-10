part of 'fragment.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Halo, Altamis 👋',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text('Sunday, 18 February 2024',
                            style: Config.textStyleBodyLarge
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: const BoxDecoration(),
                      child: Image.asset('assets/icons/user.png'),
                    )
                  ],
                ),
                const Margin(),
                TextField(
                  style:
                      Config.textStyleTitleSmall.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10.0),
                    hintStyle: Config.textStyleTitleSmall
                        .copyWith(color: Colors.white),
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
                const Margin(),
                Row(
                  children: [
                    Text('Event',
                        style: Config.textStyleHeadlineSmall
                            .copyWith(color: Colors.white)),
                    const Spacer(),
                    Row(
                      children: [
                        Text('Lihat Semua ',
                            style: Config.textStyleTitleSmall
                                .copyWith(color: Config.buttonColor)),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Config.buttonColor,
                          size: 14,
                        )
                      ],
                    ),
                  ],
                ),
                const Margin(),
                SizedBox(
                  height: 275,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.detailEventScreen);
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
                Text('Untuk kamu 😄',
                    style: Config.textStyleHeadlineSmall
                        .copyWith(color: Colors.white)),
                const SizedBox(height: 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
