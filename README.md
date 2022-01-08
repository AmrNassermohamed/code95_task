
# Query Builder

A QueryBuilder project created in flutter using MobX and Provider. Boilerplate supports  mobile, is used to filter list o user


## Acknowledgements

 - [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Know :State mangament provider]("https://pub.dev/packages/provider")
- [know :Resfaul Api and http]("https://pub.dev/packages/http")
## API Reference

#### Get all repos

```http
  https://mocki.io/v1/56240ba1-44a1-4559-a759-8f93179dafbf
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `full_name` | `string` | get full name first and last in string |
| `first_name`| `string` | get first_name in string |
| `last_name` | `string` | get last_name in string |
| `gender`    | `Int`    | get  gender in int |
| `age`       | `age`    | get  age in int |




## Authors

- [@AmrNassermohamed](https://github.com/AmrNassermohamed)


## Libraries & Tools Used
- http,
- provider,
- autoSizetext,
- hexcolor

## QueryBuilder Features

- MobX (to connect the reactive data and filter it of your application with the UI)
- Provider (State Management)
- Validation
- Routing
- Theme
- http






## Floder Structure
-QueryBuilder/
- android
- build
- ios
- lib
- test

Here is the folder structure we have been using in this project

Lib/
- constants
- data
- provider
- screen
- utils
- model
- main.dart
- routes.dart
- components
- services

Now, lets dive into the lib folder which has the main code for the application.

- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
- data and services - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
- provider - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI. 
- screen — Contains all the ui of your project, contains sub directory for each screen.
- utils — Contains the utilities/common functions of your application.
- components — Contains the common widgets for your applications. For example, Button, TextField etc.
- routes.dart — This file contains all the routes for your application.
- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.


## Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:
constants/
- app_color.dart
- app_lookups.dart



## Data And services
All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories local, network and sharedperf, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

Data /
- data_queryBuilder.dart

Services /
- services.handler.dart

## Ui
This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in screen directory as shown in the example below:

Screen /
 - QueryBuilder
 - userScreen

##  components
Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

components/
- text_global.dart
- button_global.dart
- avatat_icon.dart

## Main
This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
      MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) =>QueryBuilderProvider(),),
      //create: (_) => LocalizationProvider(),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
          debugShowCheckedModeBanner: false,
          home:QueryBuilder(), //SubSubdepartment(id: 12.toString(),),


    );
  }
  }



