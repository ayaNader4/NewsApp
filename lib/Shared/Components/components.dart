import 'package:flutter/material.dart';
import 'package:news/Modules/WebView/WebView.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget carouselItem(context,Map artical)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(
          '${artical['url']}')));
    },
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(
                '${artical['urlToImage']}'),fit: BoxFit.cover,colorFilter: ColorFilter.linearToSrgbGamma())
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120,left: 10),
          child: Text(
            '${artical['title']}',
            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,backgroundColor: Colors.black.withOpacity(.5)),maxLines: 2,
          ),
        ),
      ],
    ),
  ),
);

Widget ListItem(context ,Map artical)=>InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(
        '${artical['url']}')));
  },
  child:   Container(

    color: Colors.white,

    height: 140,

    width: 400,

    child: Expanded(

      child: Row(

        children: [

          Container(

            height: 140,

            width: 110,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(35),

              image: DecorationImage(image:NetworkImage('${artical['urlToImage']}'),fit: BoxFit.cover)

            ),

          ),

          Expanded(

            child: Padding(

              padding: const EdgeInsets.only(left: 5),

              child: Expanded(

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text('${artical['title']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),

                    Spacer(),

                    Expanded(

                      child: Row(

                        children: [

                          Text('${artical['publishedAt']}',style: TextStyle(fontSize: 15,color: Colors.grey)),

                          Spacer(),

                          IconButton(onPressed: (){
                            print('object');
                          }, icon: Icon(Icons.bookmark_outlined,color: Colors.grey,))

                        ],

                      ),

                    )

                  ],

                ),

              ),

            ),

          )

        ],

      ),

    ),

  ),
);