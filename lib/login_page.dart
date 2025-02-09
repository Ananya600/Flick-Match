import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
   LoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black45,

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to FlickMatch!',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),

            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
              child: MaterialButton(
                minWidth: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>HomePage())
                  );
                },
                child: const Text('Next',
                style: TextStyle(color: Colors.white),
                )

              ),
            ),
          ],
        ),
      ),
    );
  }}