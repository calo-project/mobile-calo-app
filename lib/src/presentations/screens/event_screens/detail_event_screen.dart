part of '../screen.dart';

class DetailEventScreen extends StatelessWidget {
  const DetailEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Konser'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/billie_eilish.png',
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'BILLIE EILISH',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Indonesian Tour',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.location_on, 'Lokasi', 'Stadion Gelora Bung Tomo'),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.date_range, 'Tanggal', '12 Februari 2024'),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.access_time, 'Waktu', '19:00 - 23:00 WIB'),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.money, 'Harga', 'Rp 1.000.000,-'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
