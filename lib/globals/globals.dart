library hfs_flutter_app.globals;

import 'package:intl/intl.dart';
import 'package:sticker_app/models/user_info_details.dart';

UserInfoDetails userInfoDetails = new UserInfoDetails('', '', '', '', '');

String userAccountEmail = "";
bool isEmailVerified = false;

final String CORREO = 'Correo';
final String CONTRASENYA = 'Contraseña';
final String URL_LOGO_POR_DEFECTO = 'https://lh3.googleusercontent.com/-Hz_AWw7pDnE/XNBsJYnSJ-I/AAAAAAAAAAs/0e1IBzYaqKE9UIrl6c0fdF-Ph8OeZiKUACEwYBhgL/w140-h140-p/flutter-logo-round.png';
final String INICIAR_SESION_CORREO = 'Iniciar sesión con correo';
final String CREAR_CUENTA_CORREO = 'Crear una cuenta con correo';
final String TIENES_CUENTA_INICIA_SESION = 'Tienes una cuenta? Inicia sesión';
final String CORREO_VACIO = 'El correo no puede estar vacío';
final String CONTRASENYA_VACIA = 'La contraseña no puede estar vacía';
final String ENLACE_VERIFICAR_CUENTA = 'Se ha enviado un enlace a tu correo para verificar la cuenta';
final String INICIAR_SESION_GOOGLE = 'Iniciar sesión con Google';

final String APPBAR_MENU_PRINCIPAL = 'Sticker App';

final String tabPanelName = "Panel";
final String tabStickersName = "Stickers";
final String tabPerfilName = "Perfil";

final String PANEL_HISTORIAL = "Historial";
final String PANEL_SUGERENCIAS = "Sugerencias";
final String PANEL_STICKERS = "Stickers";

final String PANEL_BARCODE_PRODUCT_BASE_URL = 'https://world.openfoodfacts.org/api/v0/product/';
final String PANEL_BARCODE_PRODUCT_BASE_URL_END = '.json';

final String PANEL_SEARCH_PRODUCTS_BASE_URL = 'https://world.openfoodfacts.org/cgi/search.pl?search_terms=';
final String PANEL_SEARCH_PRODUCTS_BASE_URL_END = '&search_simple=1&action=process&page_size=100&json=1&sort_by=unique_scans_n';

final String PANEL_HISTORY_PRODUCT_01_IMAGE = 'https://static.openfoodfacts.org/images/products/342/155/711/1051/front_fr.16.100.jpg';
final String PANEL_HISTORY_PRODUCT_02_IMAGE = 'https://static.openfoodfacts.org/images/products/841/162/000/1155/front_es.3.100.jpg';
final String PANEL_HISTORY_PRODUCT_03_IMAGE = 'https://static.openfoodfacts.org/images/products/841/399/307/0103/front_es.4.100.jpg';
final String PANEL_HISTORY_PRODUCT_04_IMAGE = 'https://static.openfoodfacts.org/images/products/327/019/019/8611/front_fr.107.100.jpg';

final String PANEL_SUGERENCIAS_PRODUCT_01_IMAGE = 'https://static.openfoodfacts.org/images/products/848/000/033/6170/front_es.8.100.jpg';
final String PANEL_SUGERENCIAS_PRODUCT_02_IMAGE = 'https://static.openfoodfacts.org/images/products/843/187/626/1035/front_es.5.100.jpg';
final String PANEL_SUGERENCIAS_PRODUCT_03_IMAGE = 'https://static.openfoodfacts.org/images/products/841/070/700/0197/front_ro.7.100.jpg';
final String PANEL_SUGERENCIAS_PRODUCT_04_IMAGE = 'https://static.openfoodfacts.org/images/products/848/001/000/8173/front_es.4.100.jpg';

final String APPBAR_PRODUCTO = "Producto";

final String STICKERS_SUGERENCIAS = "Sugerencias";
final String STICKERS_STICKERS_USUARIO = "Tus Stickers";

final String PRODUCTO_TAB_PRODUCTO = "Producto";
final String PRODUCTO_TAB_COMPOSICION = "Composición";
final String PRODUCTO_TAB_INFORMACION = "Información";

final String APPBAR_LISTA_PRODUCTOS_ENCONTRADOS = "Lista de productos encontrados";

final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");