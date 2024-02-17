# How to Contribute? 
Thank you for your interest in contributing to this project! 

By contributing, you help improve the game and make it a valuable resource for medical professionals. Before you start contributing, please read and follow these guidelines.

## How to Setup?

### 1. Fork the Repository

Fork the [adityathakurxd/doctordiagnose](https://github.com/adityathakurxd/doctordiagnose) repository to your GitHub account. You can do this by clicking the "Fork" button on the top right of the repository page.

### 2. Clone the Repository

Clone your forked repository to your local machine.

```bash
git clone https://github.com/your-username/doctordiagnose.git
```

### 3. Navigate to the Project Directory

Change into the project directory.

```bash
cd doctordiagnose
```

### 4. Install Dependencies

Install the project dependencies using Flutter.

```bash
flutter pub get
```

### 5. Set Up API Key

Create a new file called `.env` in the project directory and add your API key. To use the Gemini API, you'll need an API key. If you don't already have one, [create a key in Google AI Studio](https://aistudio.google.com/app/apikey).

```env
API_KEY=YOUR_API_KEY
```

### 6. Generate `env.g.dart` File

This project uses [envied](https://pub.dev/packages/envied) to read environment variables. Run the following command to generate an `env.g.dart` file using [build_runner](https://pub.dev/packages/build_runner).

```bash
dart run build_runner build -d
```

### 7. Run the Application

Run the application to ensure everything is set up correctly.

```bash
flutter run -d chrome
```

## How to Submit Changes?

Once you have made your changes, push them to your forked repository and create a pull request. Please provide a clear and descriptive title for your pull request, outlining the changes you have made.

Certainly! Here's a template for your CODE_OF_CONDUCT.md file:

---

## Code of Conduct

### Introduction

We, as contributors and maintainers of doctordiagnose, pledge to create a respectful and inclusive environment for everyone involved in this project. This Code of Conduct outlines our expectations for all those who participate in contributing to the project, as well as the consequences for unacceptable behavior.

### Our Standards

We strive to maintain a welcoming and harassment-free space for all contributors, regardless of their background and experience. Examples of behavior that contributes to creating a positive environment include:

- **Respectful Communication:** Use welcoming and inclusive language. Be respectful of different viewpoints and experiences.
- **Collaboration:** Work together towards common goals. Embrace constructive criticism and feedback.
- **Inclusivity:** Be open-minded and considerate of others. Encourage diverse perspectives and ideas.

### Unacceptable Behavior

Unacceptable behaviors include, but are not limited to:

- **Harassment:** Any form of unwelcome behavior, whether verbal, written, or physical, that creates an intimidating, hostile, or offensive environment.
- **Discrimination:** Any actions that perpetuate discrimination based on race, gender, sexual orientation, disability, nationality, religion, or any other protected characteristic.
- **Disruptive Behavior:** Intentional disruption of discussions or activities, online or offline.

### Reporting Guidelines

If you witness or experience behavior that violates this Code of Conduct, please report it to the project maintainers at `mail@adityathakur.in`. All reports will be kept confidential, and the maintainers will respond as promptly as possible to address the issue.

### Consequences

Unacceptable behavior will not be tolerated. If a contributor engages in behavior that violates this Code of Conduct, the maintainers may take appropriate action, including temporary or permanent removal from the project.

### Scope

This Code of Conduct applies to all project spaces, including GitHub repositories, discussions, and events associated with the project.

### Acknowledgment

This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org/), version 2.0, available at [https://www.contributor-covenant.org/version/2/0/code_of_conduct.html](https://www.contributor-covenant.org/version/2/0/code_of_conduct.html).

By contributing to the doctordiagnose repository, you agree to abide by this Code of Conduct.
