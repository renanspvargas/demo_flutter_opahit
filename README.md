# Lucky Investor
## Version 1.0.0

This project is a MVP, from version 2 onwards, it must follow the gitflow rules listed below

Creating this project with the object of proving my Flutter/dart skills

Ideia from: [Github](https://github.com/guideti/variacao-ativo)

:warning: Due to the size of the mock file, the startup of the app is much slower than ideal, but this will be corrected as soon as the api is deployed

## :satellite: Instalation

Clone: `git clone https://github.com/renanspvargas/masterclass_app.git`

Enter dir `cd masterclass_app`

Install Packages `flutter pub get`

## :fuelpump: Generating builds

If you want to build for another SO change your `flutter config`

Then run `flutter create .`

Note: This project is only set for Android because I'm actually working on a windows machine. For this reason I was not able launch and test for the iOS platform.

## :ferris_wheel: Structure 

### Packages

- get: for state management, dependency injection, networking and navigation
- fl_chart: to create beautiful charts
- intl: formatting dates

### Architecture

The project is organized in a modular pattern, so everythin that is common for the entire app is in the **Core**. Every feature MUST be created inside its own folder with everything related to it.

When creating a feature you must:

 - Create a **Page**: every related do the view
 - Create a **Controller**: establish the bridget between the view and the data source
 - Create a **Binding**: its primordial for maintaining the efficiency and memory safety
 - Create a **Route** class: there you can organize your widgets, binds and paths
 - Create a **Exceptions**: every KNOWN exception must be treated
 - When working with data, create a **Model**
 - When working with retrieving data from any source, create a **Interface** and then implement it
 - When working with constants, everything must by static
 - Imports must be full path from package
 - The core folder ONLY accepts common objects that will be used across the app
 
 ### Gitflow
 ![gitflow](https://user-images.githubusercontent.com/56892961/223226148-a77388ef-844c-4de7-8281-984f1644d362.png)

 
 ## :nut_and_bolt: TODO
 - App theme
 - TextField suggestions
 - Unit tests!
