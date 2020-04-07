<div align="center">
    <img src="assets/images/logo.png" alt="Logo" width="100%">
</div>

# Boilerplate Flutter Nafanesia

A boilerplate project created in flutter using Provider, Get_it, Dio and Sqflite.   

## Getting Started

The boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

```
if you love this boilerplate, give us a star, you will be an encouragement in our lives.
```

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/nafanesia/boilerplate-flutter-nafanesia.git
```
**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

``` 
flutter pub get 
```

## Boilerplate Features:

* Splash
* Login
* Home
* Routing
* Theme
* Flavor (Dev, Stag, Prod)
* Connectivity
* Dio (Http request)
* Sqlite (Local database sql)
* Shared Preferences (simple storage)
* Provider (State Management)
* Get It (Depedency Injection)
* Screen Utils (Adapting screen & font size)
* Device Preview (Check in different size screen)

### Libraries & Tools Used

* [Dio](https://pub.dev/packages/dio) (^3.0.9)
* [Connectivity](https://pub.dev/packages/connectivity) (^0.4.8+2)
* [Sqflite](https://pub.dev/packages/sqflite) (^1.3.0)
* [Shared Preferences](https://pub.dev/packages?q=shared+preferences) (^0.5.6+3)
* [Provider](https://pub.dev/packages/provider) (^4.0.4)
* [Get It](https://pub.dev/packages/get_it) (^4.0.1)
* [Screen Utils](https://pub.dev/packages?q=screenutil) (^1.1.0)
* [Device Preview](https://pub.dev/packages/device_preview) (^0.3.0+1)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project.

```
lib/
|- constants/ : Constants(colors, font family, images, sizes, string, theme)
|- data/ : Business logic of local database, network, shared preferences
|- enums/ : Enums class 
|- models/ : Model class
|- routes/ : Routes for the applications
|- screens/ : UI for each screen
|- utils/ : Utilities / common functions
|- widgets/ : Common widget 
|- flavor.dart : Enums for select flavor (dev, stag, prod)
|- locator.dart : Depedency injector (get it)
|- main.dart : Main function for starting point
```
### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- my_colors.dart
|- my_font_family.dart
|- my_images.dart
|- my_sizes.dart
|- my_string.dart
|- my_theme.dart
```

### Data

All business logic of application, this data present to layer of application using Provider and Get it (depedency injection) so it can be easy for seperate business logic and view. let see to deep each folder:

```
data/
|- local/
    |- database_helper.dart
    |- sqlite.dart : This class will be inject
   
|- network/
    |- api/ : Make sure for each API your make to extend by base_api.dart
    |- interceptor/
    |- provider_api/
    |- service/
    |- endpoint.dart
    
|- preferences
    |- preferences.dart
```

### Enums

This directory containt all enum, i.e i make enum ViewState for status request API, state Busy or Idle.
```
enums/
|- view_state.dart
``` 

### Models

Data models for collect data from API or something else. i.e user.dart, post.dart.

```
models/
|- post.dart
|- user.dart
```  

### Routes

Routes to navigation for each screens.
```
routes/
|- src/
    |- path_routes.dart : Contains constants string path of routes
    |- routes.dart : Routes for easy way navigation 
   
|- routes.dart : This file export path_routes.dart and routes.dart in src directory to make simple import.
```

### Screens

This all UI screen, each screen is separated folder making easy to combine widget. you can make file for specific widget will be placed in 'widgets' directory as in example below:

```
screens/
|- home_screen
   |- home_screen.dart
   |- widgets
      |- home_app_bar.dart
      |- home_banner.dart
      |- home_list.dart
      |- course_item.dart
```
### Utils

Contains common and utilities file.

```
utils/
|- dio
   |- dio_exceptions.dart
   |- response_api.dart
```

### Widgets

Contains the common widgets that are shared across multiple screens.

```
widgets/
|- text_field_widget.dart
```

### Flavor

You can change the flavor for separate Dev, Stag and Prod.
```
enum FlavorEnum { DEV, STAG, PROD }

const FlavorEnum flavor = FlavorEnum.DEV; // Change this to flavor you work
```

### Locatior

This is setup all class you want to inject. example code in below:
```
import 'package:boilerplate_flutter_nafanesia/data/local/sqlite.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/login_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/posts_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/provider_api/provider_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/service/auth_service.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/service/posts_service.dart';
import 'package:boilerplate_flutter_nafanesia/data/preferences/preferences.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProviderApi());

  //Service
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => PostsService());

  //Api
  locator.registerFactory(() => LoginApi());
  locator.registerFactory(() => PostsApi());

  //Sqlite
  locator.registerLazySingleton(() => Sqlite());

  //Preferences
  locator.registerLazySingleton(() => Preferences());
}
```

### Main
Starting point of application. this contain top level of tree.

```
import 'package:boilerplate_flutter_nafanesia/constants/my_theme.dart';
import 'package:boilerplate_flutter_nafanesia/data/local/sqlite.dart';
import 'package:boilerplate_flutter_nafanesia/flavor.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:boilerplate_flutter_nafanesia/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/constants/my_string.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(
    enabled: flavor == FlavorEnum.PROD
        ? false
        : true, // Ensures that it is disabled in release mode
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: User.initial(),
      create: (_) => locator<Sqlite>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        title: MyString.appName,
        routes: Routes.routes,
        initialRoute: PathRoute.splash,
      ),
    );
  }
}
```

## About Us
[Nafaneisa](https://nafanesia.com/) is a software company that focus on web, mobile and IoT base in Bandung, Indonesia.
You'll find our [an overview of all project on our website](https://nafanesia.com/). 

## Conclusion

This is a boilerplate our version, if you liked my work don't forget to give a ⭐ star the repo to show your support. if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request. :)
