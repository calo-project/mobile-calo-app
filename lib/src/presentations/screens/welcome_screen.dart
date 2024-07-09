part of 'screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.primaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 350,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Beli Tiket,',
                        style: Config.textStyleHeadlineLarge.copyWith(
                          color: Colors.white,
                        )),
                    Text('Enjoy Event,',
                        style: Config.textStyleHeadlineLarge
                            .copyWith(color: Colors.white)),
                    Text('Bikin Kenangan.',
                        style: Config.textStyleHeadlineLarge
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset('assets/icons/shield.png', height: 24),
                        const SizedBox(width: 10),
                        Text('Aman, tanpa calo!',
                            style: Config.textStyleTitleSmall
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("Button clicked!");
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF6B4EFF),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Mulai!',
                    style: Config.textStyleButton.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
