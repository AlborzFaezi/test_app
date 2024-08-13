import 'package:flutter/material.dart';



class Detail extends StatelessWidget {
  const Detail({super.key });

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>;
    final data = routeArg["data"];
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 600,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.purpleAccent,
                            child: Center(child: Text('Year: ${data['year'].toString()}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold
                            ),),),
                          ),
                        )
                    ),
                    SizedBox(
                        width: 600,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.red,
                            child: Center(child: Text('Price: ${data['price'].toString()}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold
                            ),),),
                          ),
                        )
                    ),
                    SizedBox(
                        width: 600,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.yellow,
                            child: Center(child: Text('CPU MODEL: ${data['CPU model'].toString()}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold
                            ),),),
                          ),
                        )
                    ),
                    SizedBox(
                        width: 600,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.green,
                            child: Center(child: Text('Hard disk size: ${data['Hard disk size'].toString()}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold
                            ),),),
                          ),
                        )
                    ),
                  ],
                ),

    );
  }
}
