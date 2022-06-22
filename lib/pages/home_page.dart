// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
import 'package:flutter_codigo5_movieapp/pages/player_page.dart';
import 'package:flutter_codigo5_movieapp/sevices/api_service.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_movie_list_widget.dart';
import 'package:flutter_codigo5_movieapp/utils/constans.dart';

import '../models/genre_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> movieList = [];
  List<MovieModel> moviesListAux = [];
  List<GenreModel> genresList = [];
  final APIService _apiService = APIService();
  int indexFilter = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData2();
    //getMovies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  getData() {
    _apiService.getMovies().then((List<MovieModel> value) {
      movieList = value;
      setState(() {});
      //print(value[3].title);
    });
  }

  getData2() async {
    movieList = await _apiService.getMovies();
    moviesListAux = movieList;
    genresList = await _apiService.getGenres();
    genresList.insert(0, GenreModel(id: 0, name: "All", selected: true));
    indexFilter = genresList[0].id;
    //print(movieList[3].title);
    setState(() {});
  }

  // filterMovie() {
  //   movieList = moviesListAux;
  //   if (indexFilter != 0) {
  //     movieList = movieList
  //         .where((element) => element.genreIds.contains(indexFilter))
  //         .toList();
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 33, 47),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Welcome, (Name)",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          "ANABATA",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(3.5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff5de09c),
                            Color(0xff23dec3),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genresList
                        .map(
                          (e) => ItemFilterWidget(
                            textFilter: e.name,
                            isSelected: indexFilter == e.id,
                            onTap: () {
                              indexFilter = e.id;
                              print(indexFilter);
                              // filterMovie();
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: movieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage(
                                      index: index,
                                      item: movieList,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 14.0),
                        width: double.infinity,
                        height: height * 0.65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(4, 4),
                              blurRadius: 12.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(22.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              movieList[index].image,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(22),
                                    bottomLeft: Radius.circular(22),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      // movies[index]["original_title"],
                                      movieList[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: kBrandSecondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      // movies[index]["overview"],
                                      movieList[index].description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                              size: 14.0,
                                            ),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              // movies[index]["release_date"],
                                              convertDateTime(
                                                  movieList[index].pubdate),
                                              // movieModel.pubdate.toString().substring(0, 10),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.thumb_up_alt,
                                              color: Colors.white,
                                              size: 14.0,
                                            ),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              // movies[index]["vote_count"].toString(),
                                              movieList[index]
                                                  .duration
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.all(14.0),
                                margin: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  movieList[index].duration.toString(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return month + ' ${dateTime.day}, ${dateTime.year}';
    // ' ${dateTime.day}, ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}';
  }
}
