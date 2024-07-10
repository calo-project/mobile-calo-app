part of '../screen.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        title: const Text(
          'FAQ',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Disclaimer!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '*Aplikasi ini hanyalah sampai pada tahap Prototype dan dibangun dalam rangka Pendanaan PKM KC 2024.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Divider(height: 1, color: Colors.white),
          SizedBox(height: 16),
          FAQItem(
            question: 'Apa itu aplikasi Calo?',
            answer:
                'Calo adalah aplikasi yang memungkinkan pengguna untuk membeli tiket acara dengan menggunakan teknologi blockchain untuk meningkatkan keamanan dan transparansi.',
          ),
          SizedBox(height: 16),
          FAQItem(
            question: 'Bagaimana cara pembelian tiket di Calo?',
            answer:
                'Anda dapat membeli tiket di Calo dengan mengunjungi halaman acara yang diinginkan, memilih jumlah tiket, dan menyelesaikan pembayaran menggunakan mata uang digital yang didukung.',
          ),
          SizedBox(height: 16),
          FAQItem(
            question: 'Apakah Calo aman digunakan?',
            answer:
                'Ya, Calo menggunakan teknologi blockchain yang aman untuk memastikan keaslian dan integritas transaksi pembelian tiket.',
          ),
          SizedBox(height: 16),
          FAQItem(
            question: 'Bagaimana cara menghubungi dukungan pelanggan Calo?',
            answer:
                'Anda dapat menghubungi dukungan pelanggan kami melalui email di caloproject.id@gmail.com atau melalui fitur obrolan langsung di aplikasi.',
          ),
          SizedBox(height: 16),
          FAQItem(
            question: 'Bagaimana cara menghubungi dukungan pelanggan Calo?',
            answer:
                'Anda dapat menghubungi dukungan pelanggan kami melalui email di caloproject.id@gmail.com atau melalui fitur obrolan langsung di aplikasi.',
          ),
          SizedBox(height: 16),
          Divider(height: 1, color: Colors.white),
          SizedBox(height: 16),
          Text(
            'Syarat dan Ketentuan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae eleifend turpis. Cras eleifend sagittis ipsum, id vestibulum dolor condimentum ac. Aliquam vel libero et justo pulvinar rutrum. Suspendisse potenti. Nulla euismod augue nec sapien sodales molestie.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        if (isOpen)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.answer,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
