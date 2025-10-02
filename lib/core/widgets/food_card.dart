import 'package:flutter/material.dart';

class FoodCardScroll extends StatelessWidget {
  const FoodCardScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final foods = [
      {"name": "Veggie tomato mix", "price": "₦1,900", "image": "https://via.placeholder.com/150"},
      {"name": "Spicy fish sauce", "price": "₦2,300", "image": "https://via.placeholder.com/150"},
      {"name": "Chicken curry", "price": "₦3,100", "image": "https://via.placeholder.com/150"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Food Scroll Cards")),
      body: SizedBox(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foods.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final food = foods[index];
            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  // circular image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(food["image"]!),
                  ),
                  const SizedBox(height: 12),
                  // food name
                  Text(
                    food["name"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // price
                  Text(
                    food["price"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
