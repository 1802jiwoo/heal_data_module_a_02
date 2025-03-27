import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/providers/main_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
      mainProvider.setBmi();
    },);
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello ${mainProvider.userName},', style: titleRegular.black87,),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(mainProvider.gender == 'M' ? Icons.man : Icons.woman, size: 100, color: Colors.black,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _physicalInfo(mainProvider.height, 'Cm'),
                              Container(
                                height: 40,
                                width: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                              _physicalInfo(mainProvider.weight, 'Kg'),
                              Container(
                                height: 40,
                                width: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                              _physicalInfo(mainProvider.bmi, 'bmi'),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.6 - 10,
                          child: Stack(
                            children: [
                              Container(
                                height: 15,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF049AE8),
                                    Color(0xFF30AE80),
                                    Color(0xFF82C805),
                                    Color(0xFFC7D702),
                                    Color(0xFFECDD01),
                                    Color(0xFFF4C500),
                                    Color(0xFFF58000),
                                    Color(0xFFF55C00),
                                    Color(0xFFF40600),
                                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                  borderRadius: BorderRadius.circular(200),
                                ),
                              ),
                              
                              Positioned(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC1C1C1),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text('${mainProvider.bmi}', style: bodyMedium.white,),
                                  ),
                                ],
                              ), left: (MediaQuery.sizeOf(context).width * 0.6 - 20) / 50 * (mainProvider.bmi - 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
      
            SizedBox(height: 20,),
      
            _infoBox('Steps', Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${mainProvider.nowSteps}', style: bodyMediumSizeUp.black87,),
                    Text('/${mainProvider.targetSteps} Steps', style: bodyMedium.black87,),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            width: 150,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFFD2D2D2),
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Container(
                              height: 15,
                              width: 150 / mainProvider.targetSteps * mainProvider.nowSteps,
                              decoration: BoxDecoration(
                                color: Color(0xFF5AC107),
                                borderRadius: mainProvider.nowSteps != mainProvider.targetSteps
                                    ? BorderRadius.only(topLeft: Radius.circular(200), bottomLeft: Radius.circular(200))
                                    : BorderRadius.circular(200),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(0xFFC1C1C1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text('${(mainProvider.nowSteps / mainProvider.targetSteps * 100).round()}%', style: bodyMedium.white,),
                          ),
                          SizedBox(height: 6,),
                          Container(
                            height: 20,
                            width: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F1F1),
                            ),
                          ),
                        ],
                      ), left: 150 / mainProvider.targetSteps * mainProvider.nowSteps - 20),
                    ],
                  ),
                ),
              ],
            )),
      
            _infoBox('Heart Rate', Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBox('assets/icons/heart-rate-svgrepo-com.svg'),
                Column(
                  children: [
                    Text('${mainProvider.lastHeartRate.round()} bpm', style: bodyMediumSizeUp.black87,),
                    Container(
                      width: 90,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('Measure', style: bodyMedium.white,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 30,),
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                width: 150,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD2D2D2),
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 150 / 200 * mainProvider.minHeartRate,),
                                    Container(
                                      height: 15,
                                      width: 150 / 200 * (mainProvider.maxHeartRate - mainProvider.minHeartRate),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF5AC107),
                                        borderRadius: mainProvider.minHeartRate == 0
                                            ? mainProvider.maxHeartRate == 200 ? BorderRadius.circular(200) : BorderRadius.only(topLeft: Radius.circular(200), bottomLeft: Radius.circular(200))
                                            : mainProvider.maxHeartRate == 200 ? BorderRadius.only(topRight: Radius.circular(200), bottomRight: Radius.circular(200)) : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC1C1C1),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text('${mainProvider.minHeartRate.round()} - ${mainProvider.maxHeartRate.round()}', style: bodyMedium.white,),
                              ),
                              SizedBox(height: 6,),
                            ],
                          ), left: 150 / 200 * mainProvider.minHeartRate + 150 / 200 * ((mainProvider.maxHeartRate - mainProvider.minHeartRate) / 2) - 35),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0', style: bodyRegular.black87,),
                          Text('200', style: bodyRegular.black87,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
            
            _infoBox('Foods', Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBox('assets/icons/food-dinner-svgrepo-com.svg'),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _foodBox('assets/images/breakfast-5204360_640.jpg'),
                      SizedBox(width: 10,),
                      _foodBox('assets/images/burger-987256_640.jpg'),
                      SizedBox(width: 10,),
                      _foodBox('assets/images/chocolate-8455786_640.jpg'),
                      SizedBox(width: 10,),
                      _foodBox('assets/images/chocolate-8455786_640.jpg'),
                      SizedBox(width: 10,),
                      _foodBox('assets/images/food-1050813_640.jpg'),
                      SizedBox(width: 10,),
                      _foodBox('assets/images/pizza-3007395_640.jpg'),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, size: 40, color: Colors.black87,),
              ],
            )),
            
            _infoBox('Water', Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBox('assets/icons/water_drop_FILL0_wght400_GRAD0_opsz24.svg'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${mainProvider.nowWater}', style: bodyMediumSizeUp.black87,),
                        Text('/${mainProvider.targetWater} ml', style: bodyMedium.black87,),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('+100ml', style: bodyMedium.white,),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 70,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('+250ml', style: bodyMedium.white,),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 40,),

                Icon(Icons.more_vert, size: 40, color: Colors.black87,),
              ],
            ))
          ],
        ),
      ),
    );
  }

  SizedBox _foodBox(String image) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 5,
            child: SizedBox(
              width: 65,
              height: 65,
              child: Image.asset(image, fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            top: 2,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text('X', style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _physicalInfo(double text, String unit) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${text}', style: bodyMediumSizeUp.black87,),
          Text(unit, style: bodyRegularSizeUp.black87,),
        ],
      ),
    );
  }

  SizedBox _infoBox(String title, Row rowWidget) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleRegular.black87,),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: rowWidget,
          )
        ],
      ),
    );
  }
  
  Container _iconBox(String icon) {
    return Container(
      alignment: Alignment.center,
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: SizedBox(
        height: 35,
        width: 35,
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcIn),
        ),
      ),
    );
  }

}
