// import 'package:flutter/material.dart';
// import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
// import 'package:flutter_codigo5_movieapp/utils/constans.dart';

// import '../../pages/movie_detail_page.dart';

// class ItemMovieListWidget extends StatelessWidget {
//   MovieModel movieModel;

//   ItemMovieListWidget({
//     required this.movieModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => MovieDetailPage(
//                       movieId: movieModel.mediaid,
//                     )));
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
//         width: double.infinity,
//         height: height * 0.65,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               offset: const Offset(4, 4),
//               blurRadius: 12.0,
//             ),
//           ],
//           borderRadius: BorderRadius.circular(22.0),
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: NetworkImage(
//               movieModel.image,
//             ),
//           ),
//         ),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 12.0, vertical: 12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.8),
//                   borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(22),
//                     bottomLeft: Radius.circular(22),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       // movies[index]["original_title"],
//                       movieModel.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 4.0,
//                     ),
//                     Container(
//                       height: 3,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         color: kBrandSecondaryColor,
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 8.0,
//                     ),
//                     Text(
//                       // movies[index]["overview"],
//                       movieModel.description,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 13.0,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.date_range,
//                               color: Colors.white,
//                               size: 14.0,
//                             ),
//                             const SizedBox(
//                               width: 4.0,
//                             ),
//                             Text(
//                               // movies[index]["release_date"],
//                               convertDateTime(movieModel.pubdate),
//                               // movieModel.pubdate.toString().substring(0, 10),
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 12.0),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.thumb_up_alt,
//                               color: Colors.white,
//                               size: 14.0,
//                             ),
//                             const SizedBox(
//                               width: 4.0,
//                             ),
//                             Text(
//                               // movies[index]["vote_count"].toString(),
//                               movieModel.duration.toString(),
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 12.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 padding: const EdgeInsets.all(14.0),
//                 margin: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.8),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   movieModel.duration.toString(),
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String convertDateTime(DateTime dateTime) {
//     String month;

//     switch (dateTime.month) {
//       case 1:
//         month = 'Jan';
//         break;
//       case 2:
//         month = 'Feb';
//         break;
//       case 3:
//         month = 'Mar';
//         break;
//       case 4:
//         month = 'Apr';
//         break;
//       case 5:
//         month = 'May';
//         break;
//       case 6:
//         month = 'Jun';
//         break;
//       case 7:
//         month = 'Jul';
//         break;
//       case 8:
//         month = 'Aug';
//         break;
//       case 9:
//         month = 'Sep';
//         break;
//       case 10:
//         month = 'Oct';
//         break;
//       case 11:
//         month = 'Nov';
//         break;
//       default:
//         month = 'Des';
//     }

//     return month + ' ${dateTime.day}, ${dateTime.year}';
//     // ' ${dateTime.day}, ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}';
//   }
// }
