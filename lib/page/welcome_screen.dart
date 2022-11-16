import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/page/main_screen.dart';

class Welcome extends StatelessWidget {
  Welcome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.76),
                BlendMode.dstATop,
              ),
              image: const AssetImage(
                'assets/image/autumn_picnicpark_m.JPG',
              ),
              fit: BoxFit.fitHeight),
        ),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 40,
        ),
        child: Column(
          children: [
            Text(
              'Travel',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'EXPLORE THE BUEATY OF \nTHE KOREA',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'We are ready to offer beautiful place in Korea by season.',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Spacer(),
            Material(
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Main(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  child: Text(
                    'Let\'s Get Started',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
