import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/partner_model.dart';
import '../models/profile_model.dart';
import '../other_profile_screen.dart';

class PartnersList extends StatelessWidget {
  final List<PartnerModel> partners;

  const PartnersList({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: partners.map((partner) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OtherProfileScreen(
                      profile: ProfileModel(
                        name: partner.name,
                        company: partner.company,
                        subtitle: partner.subtitle,
                        avatarUrl: partner.avatarUrl,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(partner.avatarUrl),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            partner.name,
                            style: GoogleFonts.inriaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            partner.company,
                            style: GoogleFonts.inriaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFAF925D),
                            ),
                          ),
                          Text(
                            partner.subtitle,
                            style: GoogleFonts.inriaSans(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),
                    const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.white12,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
          ],
        );
      }).toList(),
    );
  }
}
