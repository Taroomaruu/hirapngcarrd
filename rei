import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  void togglePlay() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(AssetSource('super_complex.mp3'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // one row of the DATA section: label on the left, value on the right
  Widget dataRow(String label, Widget value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.pixelifySans(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
          value,
        ],
      ),
    );
  }

  Widget dataValue(String text) {
    return Text(
      text,
      style: GoogleFonts.pixelifySans(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color orange = const Color(0xFFFF5A00);
    Color black = const Color(0xFF080808);
    Color white = const Color(0xFFF5F5F5);
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [

          // GLITCH LINES
          Positioned(
            top: 90,
            right: -20,
            child: Container(width: 100, height: 6, color: orange),
          ),
          Positioned(
            top: 300,
            left: -30,
            child: Container(width: 90, height: 5, color: white),
          ),
          Positioned(
            top: 520,
            right: -15,
            child: Container(width: 65, height: 4, color: orange),
          ),
          Positioned(
            top: 760,
            left: -10,
            child: Container(width: 85, height: 6, color: orange),
          ),
          Positioned(
            top: 1000,
            right: -20,
            child: Container(width: 90, height: 5, color: orange),
          ),

          // MAIN PAGE
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4D4CH1 R31',
                        style: GoogleFonts.pixelifySans(
                          color: orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: orange),
                        ),
                        child: const Icon(Icons.menu, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // IMAGE (with shadow)
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: orange.withOpacity(0.5),
                              blurRadius: 15,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/adachirei.jpg',
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          color: black,
                          child: Text(
                            '// REI_001',
                            style: GoogleFonts.pixelifySans(
                              color: orange,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // SONG TITLE
                  Text(
                    'SUPER',
                    style: GoogleFonts.pixelifySans(
                      color: white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'COMPLEX',
                    style: GoogleFonts.pixelifySans(
                      color: orange,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(width: 40, height: 3, color: orange),
                      const SizedBox(width: 10),
                      Text(
                        '¿SHIMON?',
                        style: GoogleFonts.pixelifySans(
                          color: white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // SONG CONTAINER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: orange,
                      boxShadow: [
                        BoxShadow(
                          color: orange.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [

                        // PLAY BUTTON
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: togglePlay,
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUPER COMPLEX',
                              style: GoogleFonts.pixelifySans(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '¿shimon? × ADACHI REI',
                              style: GoogleFonts.pixelifySans(
                                color: Colors.black54,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // LYRIC
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: orange, width: 4),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '死んじゃえば',
                          style: GoogleFonts.pixelifySans(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '死んじゃえば',
                          style: GoogleFonts.pixelifySans(
                            color: orange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '楽になると 思っちゃった',
                          style: GoogleFonts.pixelifySans(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // SYSTEM BOX
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '// SYSTEM_LOG',
                          style: GoogleFonts.pixelifySans(
                            color: orange,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '隕石さえ 落ちちゃえば',
                          style: GoogleFonts.pixelifySans(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '人類さえ 滅んじゃえば',
                          style: GoogleFonts.pixelifySans(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // DATA
                  Text(
                    '// DATA',
                    style: GoogleFonts.pixelifySans(
                      color: orange,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  dataRow('CHARACTER', dataValue('4D4CH1 R31')),
                  dataRow('VOICE', dataValue('ADACHI REI')),
                  dataRow(
                    'TRACK',
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.pixelifySans(
                          color: white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: 'SUPER '),
                          TextSpan(
                            text: 'COMPLEX',
                            style: TextStyle(color: orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                  dataRow('CREATOR', dataValue('SHIMON')),
                  dataRow('STATUS', dataValue('SIGNAL ACTIVE')),
                  const SizedBox(height: 30),

                  // INPUT
                  Text(
                    '// MESSAGE',
                    style: GoogleFonts.pixelifySans(
                      color: orange,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'type something...',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white10,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: orange),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // SEND BUTTON
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(backgroundColor: orange),
                      child: Text(
                        'SEND',
                        style: GoogleFonts.pixelifySans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // END
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'また来世',
                          style: GoogleFonts.pixelifySans(
                            color: white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'バイバイ　バイバイ',
                          style: GoogleFonts.pixelifySans(
                            color: orange,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'SUPER COMPLEX // 001',
                          style: GoogleFonts.pixelifySans(
                            color: Colors.white38,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
