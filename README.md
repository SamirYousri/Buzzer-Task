# Buzzer Task

A Flutter application for authentication and data management. The app uses **Firebase Authentication**, **Cloud Firestore**, **state management**, and follows clean code principles to ensure maintainability and scalability.

## Demo Video
Watch the app in action:
[Authentication Task Demo](https://drive.google.com/file/d/1MxE95uaxMB2WXiCd0-ZthUnip6EwT-ed/view?usp=sharing)


## Features

- User authentication using Firebase Authentication (Email/Password).
- Data storage and retrieval from Cloud Firestore.
- Use of models for structured and efficient data handling.
- State management for seamless UI and logic interaction.
- Clean code architecture for better maintainability.

## Technologies Used

- **Flutter**: For building the user interface.
- **Firebase Authentication**: For secure user login and registration.
- **Cloud Firestore**: For storing and retrieving data.
- **State Management**: Ensures dynamic and reactive UI updates.

## Database Structure

Below is the Firestore database structure used in the project:

```plaintext
allPlaces (collection)
  |
  ├── cafe (document)
  |     ├── address: "Main Market Riyadh, KSA"
  |     ├── image: "assets/images/Rectangle52.png"
  |     ├── subTitle: "Cafe"
  |     ├── title: "Le Cie"
  |     ├── products (array)
  |     |     ├── 0:
  |     |          ├── image: "assets/images/MaskGroup.png"
  |     |          ├── namePlace: "Par Lane Hotel"
  |     |          ├── nameProduct: "Butter Sandwich"
  |     |          ├── oldPrice: "SAR 89"
  |     |          ├── price: "SAR 79"
  |     |          └── type: "Cafe"
  |
  ├── restaurant (document)
        ├── [similar fields and structure as cafe]

