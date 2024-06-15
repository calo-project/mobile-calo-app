part of 'fragment.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        title: const Text('Akun', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Altamis Atmaja',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '222410103043@mail.stanford.go.us',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.person, color:Colors.white),
              title: const Text('Data pribadi', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to personal data page
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color:Colors.white),
              title: const Text('Ubah password', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to change password page
              },
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet, color:Colors.white),
              title: const Text('Wallet Crypto', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to crypto wallet page
              },
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.help_outline, color:Colors.white),
              title: const Text('FAQ', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color:Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
