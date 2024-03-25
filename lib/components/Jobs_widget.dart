import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/provider/All_Deparments.dart';

class JobWidget extends StatelessWidget {
  final String imagepath;
  final String code;
  final String title;
  final String department;
  final Color jobCodeColor;
  final String jobstartdate;
  final String jobenddate;
  final VoidCallback onTap;

  const JobWidget({
    super.key,
    required this.imagepath,
    required this.code,
    required this.department,
    required this.jobCodeColor,
    required this.title,
    required this.jobstartdate,
    required this.jobenddate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);

    // Use the remainingDays function
    int remainingDays = provider.remainingDays(jobenddate);

    String finaljobtext = "";

    if (remainingDays == 0) {
      finaljobtext = "Today is last day to apply:";
    } else if (remainingDays > 0) {
      finaljobtext = " $remainingDays days left.";
    } else {
      finaljobtext = "Job opning closed.";
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imagepath,
                fit: BoxFit.cover,
              ),
            ),
            const Gutter(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Job Code",
              style: TextStyle(fontSize: 20, color: jobCodeColor),
            ),
            Text(code),
            const Gutter(),
            Text(
              "Department",
              style: TextStyle(color: jobCodeColor, fontSize: 20),
            ),
            const SizedBox(width: 4),
            Text(department),
            const SizedBox(height: 4),
            const Gutter(),
            Text(
              "Job Posted Date:",
              style: TextStyle(color: jobCodeColor, fontSize: 20),
            ),
            const Gutter(),
            Text(jobstartdate),
            const Gutter(),
            Text(
              "Job Last Date:",
              style: TextStyle(color: jobCodeColor, fontSize: 20),
            ),
            const Gutter(),
            Text(jobenddate),
            const Gutter(),
            Text(
              "Remaining Days:",
              style: TextStyle(color: jobCodeColor, fontSize: 20),
            ),
            const Gutter(),
            Text(
              (finaljobtext),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Gutter(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: jobCodeColor,
                foregroundColor: Colors.white,
              ),
              onPressed: (remainingDays += 1) > 0
                  ? onTap
                  : null, // Disable button when remaining days are 0 or negative
              child: const Text("Apply"),
            ),
          ],
        ),
      ),
    );
  }
}
