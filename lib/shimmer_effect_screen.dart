import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectScreen extends StatefulWidget {
  const ShimmerEffectScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerEffectScreen> createState() => _ShimmerEffectScreenState();
}

class _ShimmerEffectScreenState extends State<ShimmerEffectScreen> {



  bool enabled = true;

  load() async{
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      enabled = false;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("Shimmer Effect", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
                  if(enabled){
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ListTile(
                        title: Container(
                          color: Colors.white,
                          height: 10, width: 100,
                        ),
                        subtitle: Container(
                          color: Colors.white,
                          height: 10, width: 100,
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  }else{
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      // enabled: true,
                      child: ListTile(
                        title: Text("Kara Usman Bey", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        subtitle: Text("Son of Ertugrul Ghazi", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  }
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
