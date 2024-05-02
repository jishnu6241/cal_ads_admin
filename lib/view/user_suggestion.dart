import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSuggestion extends StatelessWidget {
  const UserSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder(
          future: FirebaseFirestore.instance.collection('contact_us').get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.separated(
                itemCount: documents.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colorconstant.primerycolor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    documents[index]['title'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    documents[index]['email'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                documents[index]['description'],
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              );
            }
          })
    ]);
  }
}
