# Potato Timer

This sample app offers the ability to set countdown timers for tasks. It enables users to add, stop, pause, and resume tasks conveniently. It also plays a warning alert as soon as task is finished.


## Installation

This app uses `flutter: 3.10.6` and `dart 3.0.6`, Make sure this is installed before running the app.

To run the app from terminal:

```bash
  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs
  flutter run lib/main_uat.dart
```
## Features
Listed below are some positive aspects I've highlighted :

* Defined a `base_stateless_widget` which will work as a parent of each screen. Some useful methods of this class are :
    - `onStart()` => called as soon as widget is loaded
    - `onDestroy()` => called as soon as widget is detatched
    - `onConnectivityChange()` => called as soon as internet connection changes
    - `didPopNext()`, `didPush()`, `didPop()`, `didPushNext()` => Router aware calls
    - It automatically inject the store to the child tree, so No more injection call in the child e.g: `class HomePage extends BaseStatelessWidget<HomePageStore>` this line of code will automatically take care of injecting `HomePageStore` object to the tree.

* Defined `base_store` class which acts as a parent class to each MobXStore class. Some usefule methods of this class are :
    - `init(args)` => first call when store is loaded, args is previous route args
    - `showLoader()` & `hideLoader()` => To show/hide loader on connected screen
    - `dispose()` => gets called as this store's UI will get destroyed
    - `handleException(exception)` => Child can call this method to handle the exception for UI/Crashlytics/log
* It supports multiple environments. Currently It supports `uat` and `prod`.
* Makes use of `material 3` design guidelines.
* Makes use of abstraction

#### Limitations:
* This app will stop functioning as soon as app will be killed. No task will run in the background. (killed/background => cleared from recent apps)

## Dependencies

I'm listing all major dependencies which is used for this project.

#### For Robust Architecture
* MobX (mobx + flutter_mobx)
* get_it
* Freezed (freezed + freezed_annotation)
* dartz
* injectable
* provider
* rxdart

#### For Testing
* mockito

#### For UI/UX
* another_flushbar
* auto_size_text
* connectivity_plus
* flutter_screenutil
* flutter_spinkit
* gap
* google_fonts

#### For Core Functionality
* audioplayers
* drift
* path
* path_provider
* sqlite3_flutter_libs

## Design Pattern
I'm following **Clean Architecture** design pattern, heavily inspired by reso coder and uncle bob.

In this pattern I've segregate files into three major layers:
* Presentation (View + MobxStore)
* Domain(Interface beween Presentation & Infra)
* Infrastructure(Low level API and Business Logics)

## Folder Structure

    - lib (1)
        - config (2)
            - di (3)
        - domain (4)
            - models (5)
            - value_validator_interface (6)
        - infrstructure (7)
            - database (8)
            - value_validators (9)
        - presentation (10)
            - application (11)
            - view (12)
                - core (13)
                - design_library (14)
                - screens (15)
        - utils (16)

        * Numbers are just for representational purpose, to help in explanation of each folder's purpose.



    