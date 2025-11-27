import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnalku/widgets/common_widgets.dart';

class WitnessRequest extends StatefulWidget {
  const WitnessRequest({super.key});

  @override
  State<WitnessRequest> createState() => _WitnessRequestState();
}

class _WitnessRequestState extends State<WitnessRequest> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        userName: 'Erdi Eka Fazri',
        kelas: 'XII PPLG 4',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Permintaan Saksi',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Kelola permintaan \nmenjadi saksi dari siswa lain',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F1FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      color: Color(0xFF1A73E8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'PENGIRIM',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'TANGGAL',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'KONFIRMASI',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.groups_outlined,
                      size: 55,
                      color: Colors.grey[600],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Belum ada permintaan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Belum ada yang mengirim permintaan saksi kepada Anda',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
