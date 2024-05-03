import 'package:agriplant/pages/services_page.dart';
import 'package:agriplant/widgets/service_item.dart';
import 'package:agriplant/widgets/youtube_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/services.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {

    _makingPhoneCall() async {
      var url = Uri.parse("tel:+91 9860678418");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.green.shade50,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Free consultation",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.green.shade700,
                                  ),
                            ),
                            const Text(
                                "Get free support from our customer service"),
                            FilledButton(
                              onPressed: _makingPhoneCall,
                              child: const Text("Call now"),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/contact_us.png',
                        width: 140,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Articles",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServicesPage()),
                  );
                },
                child: const Text("See all"),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ServiceItem(image: services[0].image, name: services[0].name),
              ServiceItem(image: services[1].image, name: services[1].name),
              ServiceItem(image: services[2].image, name: services[2].name),
              ServiceItem(image: services[3].image, name: services[3].name),
              ServiceItem(image: services[4].image, name: services[4].name),
              ServiceItem(image: services[5].image, name: services[5].name),
            ]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Content",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                },
                child: const Text("See all"),
              ),
            ],
          ),
          // const YoutubeVideoPlayer(videoId: 'wougJaN_Ha0'),
          // const SizedBox(height: 10),
          const YoutubeVideoPlayer(videoId: '9_Q4RBTd3ws'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button pressed!');
        },
        child: const Icon(IconlyBroken.user3,
            color: Color.fromRGBO(26, 68, 0, 1.0)),
      ),
    );
  }
}

