import 'package:calidad_servicioupeu/ui/Pedido/main_pedido.dart';
import 'package:calidad_servicioupeu/ui/Proveedor/main_proveedor.dart';
import 'package:calidad_servicioupeu/ui/Proveedor/proveedor_main.dart';
import 'package:calidad_servicioupeu/ui/Salidas/main_salidas.dart';
import 'package:calidad_servicioupeu/ui/Tienda/main_tienda.dart';
import 'package:calidad_servicioupeu/ui/listaestado/view_streams.dart';
import 'package:calidad_servicioupeu/ui/listaproducto/lista_productos.dart';
import 'package:calidad_servicioupeu/ui/listaproducto/main_productos.dart';
import 'package:calidad_servicioupeu/ui/listaperiodo/main_periodo.dart';
import 'package:calidad_servicioupeu/ui/theme/appTheme.dart';
import 'package:calidad_servicioupeu/ui/drawer/drawerUserController.dart';
import 'package:calidad_servicioupeu/ui/drawer/homeDrawer.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_main.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_pedido.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_periodo_main.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_salida_produccion.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_proveedor.dart';
import 'package:calidad_servicioupeu/ui/ticker/ticker_tienda.dart';

import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    //drawerIndex = DrawerIndex.Help;
    //screenView = HelpScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyBlack,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(


          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(

            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = SalidaProduccionApp ();
          //screenView = RegisterActivity();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = ProveedorApp();
        });
      }
      else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = MainPeriodo();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView =   TickerPeriodoApp();                 //MainPeriodo();
        });
      } else {
        //do in your way......
      }
    }
  }
}
