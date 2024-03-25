
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:saloonstore/components/Caer_widget.dart';


class DesktopService extends StatelessWidget {
  const DesktopService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverCardWidget(
                ontap: () {},
                icon: Icons.code,
                title: 'Web Design',
                description:
                    'Web design is the process of creating visually appealing and functional websites that engage users and...',
              ),
              const Gutter(),
              HoverCardWidget(
                ontap: () {},
                icon: Icons.web,
                title: 'Web Development',
                description:
                    'Web development involves building and maintaining websites or web applications using programming...',
              ),
              const Gutter(),
              HoverCardWidget(
                ontap: () {},
                icon: Icons.design_services,
                title: 'UI/UX Design',
                description:
                    'UI/UX design focuses on creating intuitive and visually appealing interfaces that enhance user...',
              ),
            ],
          ),
          const Gutter(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverCardWidget(
                ontap: () {},
                icon: Icons.shop,
                title: 'E-commerce',
                description:
                    'E-commerce refers to the buying and selling of goods or services online, allowing businesses to reach a global...',
              ),
              const Gutter(),
              HoverCardWidget(
                ontap: () {},
                icon: Icons.email,
                title: 'Digital Marketing',
                description:
                    'Digital Marketing utilizes online channels and strategies to promote products, services, and brands...',
              ),
              const Gutter(),
              HoverCardWidget(
                ontap: () {},
                icon: Icons.computer,
                title: 'Programming',
                description:
                    'Programming involves writing instructions (code) that computers can understand and execute, enabling...',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
