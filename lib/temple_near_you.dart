import 'package:flutter/material.dart';

class TempleNearYou extends StatefulWidget {
  const TempleNearYou({super.key});

  @override
  State<TempleNearYou> createState() => _TempleNearYouState();
}

class _TempleNearYouState extends State<TempleNearYou> {
  var templedetails = [
    {
      "temple_name": "Sri Subrahmanya Swamy Temple",
      "image": "assets/images/t1.jpg",
      "address":
          "West Marredpally Road, no 4, Street Number 8, opp. New Club, Secunderabad, Telangana 500026",
      "distance": "9 km"
    },
    {
      "temple_name": "Gnana Saraswathi Temple",
      "image": "assets/images/t2.jpg",
      "address": "Surya Nagar Main Rd, Surya Nagar, Thorrur, Telangana 501511",
      "distance": "12 km",
    },
    {
      "temple_name": "Sanghi Temple",
      "image": "assets/images/temple_5.jpg",
      "address": "Omerkhan daira, Hyderabad, Telangana 501511",
      "distance": "15 km",
    },
    {
      "temple_name": "Surendrapuri Temple",
      "image": "assets/images/t4.jpg",
      "address": "Yadadri -Bhuvanagiri, Road, Raigiri, Telangana 508116",
      "distance": "18 km",
    },
    {
      "temple_name": "Sita Ramachandra Swamy Temple",
      "image": "assets/images/t5.jpg",
      "address":
          "Ramalayam Rd, Bagh Ameer, Sumitra Nagar Colony, Kukatpally, Hyderabad, Telangana 500072",
      "distance": "20 km",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: templedetails.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
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
                        templedetails[index]['image']!,
                      ),
                    ),
                    title: Text(
                      templedetails[index]["temple_name"].toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red[500],
                        ),
                        Expanded(
                          child: Text(
                            templedetails[index]["address"].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          templedetails[index]["distance"].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
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
