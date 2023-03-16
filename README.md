# flutter_application_test

The name of the app is : Photos Album
Flutter version used is : 3.7.7

## About the application

The app features are :

- list of all photos (1st screen)
- ability to search by title (2nd screen that you can check using the drawer)
- details of each photo can be displayed within an alertDialog by using the extreme right "forward icon" (icon: " > " on the right).
- the theme of the app depends on the theme of your system theme when you run it.

## Getting Started

Note: The app requires internet to load datas so do not forget to run your wifi or mobile data before starting the app.

# Developer:

    - In order to run app, you first need to clone it from github within the link : https://github.com/ranaivosoa-rindra/flutter_dev_test/
    - Go to the last commit of, ether main, release, develop branches and clone the repository.
    - then on your computer run the following commands to prepare the project:
        - flutter clean
        - flutter pub get
        - flutter upgrade
    - next, run any android emulator using android studio or plug a cable and use your own device to use the flutter project. Then when all is set, run the following command:
        - flutter run --debug  => to run the project in debug mode
        - flutter run --release  => to run the project in release mode

# Tester or client

    - In order to run the app without using the method of cloning the app is to download the apk directly from the github repository which is : https://github.com/ranaivosoa-rindra/flutter_dev_test/releases
    - Download the latest release there which name is "app-release.apk", to your phone or any emulator, then install it to your phone.
    - And just find the app name which icons is flutter icon and its name is "Photos Album" and run it.

## Additionnal app features

# Developer

    - In the main list section of the app, I took all data from the api to prepare for the serching screen, also I used pagination to limit the data that I got from the API for more optimization of the app.
    - The presence of the subfolder .github/workflows/main.yml allows any developer who are using the app to perform ci/cd.
    - Thanks to that functionnality, if we want to get the apk , it is not necessary anymore to build the in the local machine before releasing it to github (or any other platform, eg: gitlab ci/cd ...).
    - So whenever the developer performs push/pull_request on specific branches such as main or release, it will automatically trigger all the jobs which are listed inside the corresponding jobs for the push/pull_request.
    - The state management I used is GetX because , its popular , easy to use and still maintained by the community.
