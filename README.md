
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
  - `dispose()` => called as soon as widget is detached
  - `onConnectivityChange()` => called as soon as internet connection changes
  - `didPopNext()`, `didPush()`, `didPop()`, `didPushNext()` => Router aware calls
  - It automatically inject the store to the child tree, so No more injection call in the child e.g: `class HomePage extends BaseStatelessWidget<HomePageStore>` this line of code will automatically take care of injecting `HomePageStore` object to the tree.

* Defined `base_store` class which acts as a parent class to each `MobXStore` class. Some usefule methods of this class are :
  - `init(args)` => first call when store is loaded, args is previous route args
  - `showLoader()` & `hideLoader()` => To show/hide loader on connected screen
  - `dispose()` => gets called as this store's UI will get destroyed
  - `handleException(exception)` => Child can call this method to handle the exception for UI/Crashlytics/log
* It has its own `design_library`(Just for this app, doesn't  have all designs defined) defined, which takes care of app specific design. So no more `Theme.of(context)` calls.
* It supports multiple environments. Currently It supports `uat` and `prod`.
* Makes use of `material 3` design guidelines.
* Makes use of SOLID with highly independent layers.
* Code is highly testable. With written unit test covering **53%** lines of code.

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

Within this pattern, I've organized files into three key layers:
* #### Presentation (View + MobxStore)

  => This layer consists of two parts: Application and view (widgets). The Application layer has all the mobxStore files. Widgets communicate with the Application, receiving results via Observable / Reaction.
* #### Domain(Interface beween Presentation & Infra)

  => Serving as a bridge, this layer connects the application and infrastructure. It primarily comprises interfaces, which are implemented by the Infrastructure layer.
* #### Infrastructure(Low level API and Business Logics)

  => This layer encompasses all business logic, low-level API calls to local storage or networks.

## Folder Structure

    - lib 
        - config 
            - di  
        - domain  
            - models  
            - value_validator_interface 
        - infrstructure 
            - database 
            - value_validators 
        - presentation 
            - application 
            - view 
                - core 
                - design_library 
                - screens 
        - utils 

## Feedback

Your feedback is highly valuable. If my submission isn't accepted, I'd greatly appreciate your insights on how I could have enhanced the code, architecture, or any aspects within it.