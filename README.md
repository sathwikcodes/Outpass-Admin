# SRM University Outpass Application

Welcome to the SRM University Outpass Application! This application streamlines the outpass request process for SRM University students. Built with Flutter, Firebase, and Twilio, our app provides a convenient and efficient way for students to apply for outpasses and for parents to approve them securely.

## About the Project

The SRM University Outpass Application simplifies the outpass request workflow by digitizing the entire process. Students can submit outpass requests through the app, which are then sent to their parents for approval. Once approved, the outpass is generated and can be collected by the student from the designated authority.

Additionally, the app features a QR code generation and scanning functionality. Upon approval, a unique QR code is generated for the student's outpass. This QR code can be scanned by the designated authority to mark the student as "outgone," facilitating seamless tracking and verification of outpasses.

The app utilizes Firebase for cloud storage and Twilio for OTP verification, ensuring secure communication and authentication throughout the process.

## Key Features

- **User Authentication**: Secure user authentication using Firebase Authentication.
- **Outpass Request Submission**: Students can submit outpass requests directly from the app.
- **Parent Approval**: Outpass requests are sent to parents for approval via SMS with OTP verification.
- **QR Code Generation**: Unique QR codes are generated for approved outpasses.
- **QR Code Scanning**: Authorities can scan QR codes to mark students as "outgone."
- **Real-time Updates**: Students receive real-time updates on the status of their outpass requests.
- **Profile Management**: Users can manage their profiles and update contact information as needed.

## Getting Started

1. **Clone the Repository**: Clone this repository to your local machine using Git:
git clone https://github.com/sathwikcodes/Outpass-Admin.git

2. **Set Up Firebase**: Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/) and configure Firebase Authentication and Firestore.

3. **Update Firebase Configuration**: Update the Firebase configuration in your Flutter project by replacing the `google-services.json` file for Android or `GoogleService-Info.plist` file for iOS.

4. **Set Up Twilio**: Sign up for a Twilio account and obtain API credentials for SMS messaging and OTP verification.

5. **Update Twilio Configuration**: Update the Twilio configuration in your Flutter project with your Twilio API credentials.

6. **Install Dependencies**: Navigate to the project directory and install the necessary dependencies using Flutter's package manager:
cd outpass-app
flutter pub get

7. **Run the App**: Launch the Flutter app on your device or simulator:

8. **Start Using the App**: Students can create accounts, submit outpass requests, and track their status. Parents can receive and approve outpass requests via SMS OTP verification. Authorities can scan QR codes to mark students as "outgone."


## Contributing

Contributions to the SRM University Outpass Application are welcome! If you have any ideas for new features, improvements, or bug fixes, please feel free to [open an issue](https://github.com/sathwikcodes/Outpass-Admin/issues) or submit a pull request.

## Credits

- Project developed by [Sathwik Batta]
- Technologies used:
- Flutter
- Firebase
- Twilio

## License

This project is licensed under the [MIT License](LICENSE).
