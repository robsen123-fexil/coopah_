import 'package:coopah/constants.dart';
import 'package:flutter/material.dart';



class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  bool isCelsius = true;
  double temperatureCelsius = 24;

  // Function to toggle between Celsius and Fahrenheit
  void toggleTemperature() {
    setState(() {
      isCelsius = !isCelsius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 63, left: 24, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Container
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 366,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 251, 249, 249),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Container(
                      width: 350,
                      height: 350 < 300 ? 350 * 3 / 4 : 350 * 9 / 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/sun.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),

              // Title Text (Centered)
              Text(
                'THIS IS MY WEATHER APP',
                textAlign: TextAlign.center,
                style: titleTextStyle,
              ),

              SizedBox(height: 20),

              // Temperature and Location - Left aligned
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature', style: sectionTitleStyle),
                      SizedBox(height: 5),
                      Text(
                        "${isCelsius ? temperatureCelsius : (temperatureCelsius * 9 / 5) + 32} degrees",
                        style: sectionTextStyle,
                      ),
                      SizedBox(height: 5),
                      Text("Location", style: sectionTitleStyle),
                      SizedBox(height: 5),
                      Text("London", style: sectionTextStyle),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Celsius/Fahrenheit Switch Row (Centered)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text("Celsius/Fahrenheit ", style: sectionTextStyle),
                  ),
                  SizedBox(width: 10),
                  SwitchButton(
                    isCelsius: isCelsius,
                    onToggle: toggleTemperature,
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Button positioned at the bottom (Centered)
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // Action for button press
                  },
                  style: refreshButtonStyle,
                  child: Text('Refresh', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  final bool isCelsius;
  final Function onToggle;

  SwitchButton({required this.isCelsius, required this.onToggle});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onToggle(); // Call the onToggle method passed from the parent
      },
      child: Container(
        width: 42,
        height: 28,
        decoration: BoxDecoration(
          color: Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 2,
              right: widget.isCelsius ? 2 : 16,
              bottom: 2,
              left: widget.isCelsius ? 16 : 2,
              child: AnimatedAlign(
                duration: Duration(milliseconds: 200),
                alignment:
                    widget.isCelsius
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
