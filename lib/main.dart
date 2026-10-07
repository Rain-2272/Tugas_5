import 'package:flutter/material.dart';

void main() {
  runApp(const KartuIdentitasApp());
}

class KartuIdentitasApp extends StatelessWidget {
  const KartuIdentitasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Identitas Digital',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Arial'),
      home: const KartuIdentitasPage(),
    );
  }
}

class KartuIdentitasPage extends StatefulWidget {
  const KartuIdentitasPage({super.key});

  @override
  State<KartuIdentitasPage> createState() => _KartuIdentitasPageState();
}

class _KartuIdentitasPageState extends State<KartuIdentitasPage> {
  bool modeGelap = false;

  void ubahTema() {
    setState(() {
      modeGelap = !modeGelap;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color warnaUtama = modeGelap
        ? const Color(0xFF6BCB95)
        : const Color(0xFF1B7A4B);

    final Color warnaLatar = modeGelap
        ? const Color(0xFF121212)
        : const Color(0xFFF1F7F3);

    final Color warnaKartu = modeGelap ? const Color(0xFF1E1E1E) : Colors.white;

    final Color warnaTeks = modeGelap ? Colors.white : const Color(0xFF202020);

    final Color warnaSekunder = modeGelap
        ? Colors.white70
        : Colors.grey.shade600;

    return Scaffold(
      backgroundColor: warnaLatar,
      appBar: AppBar(
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Kartu Identitas Digital',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 500),
                decoration: BoxDecoration(
                  color: warnaKartu,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header kartu
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: warnaUtama,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.badge, color: Colors.white, size: 30),
                          SizedBox(width: 10),
                          Text(
                            'IDENTITAS MAHASISWA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Isi kartu
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Foto mahasiswa
                          Container(
                            width: 145,
                            height: 145,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: warnaUtama, width: 5),
                            ),
                            child: const CircleAvatar(
                              radius: 68,
                              backgroundColor: Color(0xFFDCEFE4),
                              backgroundImage: AssetImage(
                                'assets/foto_saya.jpg',
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          Text(
                            'Rain Heart Tanggela',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: warnaTeks,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'Mahasiswa Teknik Komputer',
                            style: TextStyle(
                              color: warnaSekunder,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Data diri
                          InfoData(
                            icon: Icons.badge_outlined,
                            label: 'NIM',
                            value: '20246312015',
                            warnaUtama: warnaUtama,
                            warnaTeks: warnaTeks,
                          ),

                          const SizedBox(height: 12),

                          InfoData(
                            icon: Icons.school_outlined,
                            label: 'Program Studi',
                            value: 'Teknik Komputer',
                            warnaUtama: warnaUtama,
                            warnaTeks: warnaTeks,
                          ),

                          const SizedBox(height: 12),

                          InfoData(
                            icon: Icons.computer_outlined,
                            label: 'Konsentrasi',
                            value: 'AI dan Perangkat Lunak',
                            warnaUtama: warnaUtama,
                            warnaTeks: warnaTeks,
                          ),

                          const SizedBox(height: 12),

                          InfoData(
                            icon: Icons.code_outlined,
                            label: 'Bidang Minat',
                            value: 'Programming & Teknologi',
                            warnaUtama: warnaUtama,
                            warnaTeks: warnaTeks,
                          ),

                          const SizedBox(height: 25),

                          // Tombol ubah tema
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: ubahTema,
                              icon: Icon(
                                modeGelap ? Icons.light_mode : Icons.dark_mode,
                              ),
                              label: Text(
                                modeGelap
                                    ? 'Gunakan Mode Terang'
                                    : 'Gunakan Mode Gelap',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: warnaUtama,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Text(
                modeGelap ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
                style: TextStyle(
                  color: warnaSekunder,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan data mahasiswa
class InfoData extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color warnaUtama;
  final Color warnaTeks;

  const InfoData({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.warnaUtama,
    required this.warnaTeks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: warnaUtama.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: warnaUtama, size: 25),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: warnaUtama,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: TextStyle(
                    color: warnaTeks,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
