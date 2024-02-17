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
