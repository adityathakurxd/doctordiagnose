# Doctor Diagnose
A Flutter-based application designed for medical professionals to enhance their diagnostic skills by guessing possible causes of symptoms using Google's Gemini model.

➡️ Try it out here: [dodiagnose.web.app](https://dodiagnose.web.app/)

![Doctor Diagnose Banner](https://github.com/adityathakurxd/doctordiagnose/assets/53579386/cea8803e-f94b-4314-959b-1016edea7a31)


## Disclaimer

This game is intended for educational purposes only and should not be used as a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.

## Getting Started
1. Fork the repository and clone it to your system
2. Navigate to the project directory
	```
	cd doctordiagnose
	```
3. Install dependencies
	```
	flutter pub get
	```
4. Create a new file called `.env` in the project directory and add your API key. To use the Gemini API, you'll need an API key. If you don't already have one, [create a key in Google AI Studio](https://aistudio.google.com/app/apikey).
	```
	API_KEY = YOUR API KEY
	```
5. This project uses [envied](https://pub.dev/packages/envied) to read environment variables. Run the following command to generate an `env.g.dart` file using [build_runner](https://pub.dev/packages/build_runner)
	```
	dart  run  build_runner  build  -d
	```
6. Run the application
	```
	flutter run -d chrome
	```
## Contributing:

We welcome contributions to improve and expand the functionality of this game. If you'd like to contribute, please follow our [contribution guidelines](./CONTRIBUTING.md).

