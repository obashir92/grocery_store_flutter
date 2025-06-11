import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Column(
          children: [

            // LOGO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: SvgPicture.asset("lib/images/vegetables.svg"),
            ),
        
            // TEXT1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
        
            const SizedBox(height: 20),
        
            // TEXT2
            Text("Fresh items everyday",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
        
            // BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()),
                  );
                  },
                child: Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Text("Get started",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    )
                  ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
