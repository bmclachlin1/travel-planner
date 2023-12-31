/// NetworkImages we use throughout the app
class NetworkImages {
  static const backgroundImageUri =
      'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1244&q=80';
}

/// Common sizes we use throughout the app
class Sizes {
  static const double xs = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xl = 32.0;

  static const double containerWidth = 350;

  static const double borderWidth = 2.0;
}

/// Texts we use throughout the app
///
/// Will allow for localization in the future (en and fr).
class Texts {
  static const genericError = 'Something went wrong.';
  static const htmlWindowTitle = 'Travel Planner';
  static const appBarTitle = 'T R A V E L   P L A N N E R';
  static const cardHeader = 'Choose your destination!';
  static const dropdownHintText = 'Select a city';
  static const numberOfDaysHintText = 'Select how many days for forecast';
  static const citiesCollection = 'cities';
  static const descriptionHeader = 'Description';
  static const descriptionHintText =
      'Please select a city to get a description';
  static const weatherHeader = 'Weather Forecast';
  static const weatherHintText =
      'Please select a city and weather day to get the weather';
}

class Forecast {
  static const days = [1, 2, 3, 4, 5];
  static const forecastApiRate = 3;
}
