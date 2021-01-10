import 'package:education_feed/injection.dart';
import 'package:education_feed/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.I<AppProvider>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        title: 'Education',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, pr, __) => Scaffold(
        body: pr.isNewsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: List.generate(
                      pr.news.length,
                      (index) => Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(pr.news[index].author ?? 'Anon',overflow: TextOverflow.ellipsis,),
                                      Spacer(),
                                      PopupMenuButton(
                                        itemBuilder: (context) => <PopupMenuEntry>[
              ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Material(
                                      elevation: 10,
                                      child: pr.news[index].image!=null?Image.network(pr.news[index].image??'google.com'):Container(),
                                    ),
                                  ),
                                  Text(pr.news[index].description,maxLines: 3,),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
      ),
    );
  }
}
