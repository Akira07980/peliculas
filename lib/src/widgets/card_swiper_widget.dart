import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
//Necesito recibir la lista de tarjetas que debo mostrar
  final List<Pelicula> peliculas;
  //Se inicializa en el constructor y debe ser requerida la lista de peliculas o genera error
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    //Doy un nombre al mediaquery.of.size para usarlo luego
    //EL medaquery me trae información dle dispositivo, en este caso solicito
    //para determinar el tamaño y ancho de las tarjetas
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: new Swiper(
        //Yo quiero el 70% del ancho y se solicita multiplicando por 0,7
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          //Para hacer bordes redondos se aplica ClipRRect
          return ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: peliculas.length,
//        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
