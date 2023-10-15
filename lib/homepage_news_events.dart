import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsEvent extends StatefulWidget {
  const NewsEvent({super.key});

  @override
  State<NewsEvent> createState() => _NewsEventState();
}

class _NewsEventState extends State<NewsEvent> {
  var news = [
    {
      "desc": "Ayodhya Ram temple priests & staff given pay hike of 35%",
      "image": "assets/images/ayodhya.jpg",
    },
    {
      "desc": "Tirumala trust to issue 7 lakh darshan tickets during Vaikun",
      "image": "assets/images/tirumala.jpg",
    },
    {
      "desc": "15 Oct Panachikkadu Festival",
      "image": "assets/images/pan.jpeg",
    },
    {
      "desc":
          "18 Oct Fulfilment of wishes. Balaji Temple, Auroville, Arunachala",
      "image": "assets/images/18Oct.jpeg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: news.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.all(5),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        news[index]["image"]!,
                      ),
                    ),
                    title: Text(
                      news[index]["desc"].toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, color: Colors.red[900]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.red[900],
                          size: 20,
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
