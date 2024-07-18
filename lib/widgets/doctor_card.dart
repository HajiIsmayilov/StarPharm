import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String hospital;
  final String imageUrl;

  Doctor({required this.name, required this.hospital, required this.imageUrl});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      hospital: json['username'],
      imageUrl: json['images'],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String hospital;
  final String imageUrl;

  const DoctorCard({super.key, required this.name, required this.hospital, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Image.network(
              imageUrl,
              height: 100.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(hospital),
        ],
      ),
    );
  }
}
