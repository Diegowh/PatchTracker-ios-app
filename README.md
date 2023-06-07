# PatchTracker iOS App (Frontend)

> This repository contains the frontend system of the PatchTracker application, an iOS app designed to display patch notes for Valorant.

## Tech stack

* Swift
* SwiftUI
* UIKit

## Functionality

The PatchTracker app communicates with a backend service to fetch and display patch notes for Valorant. You can select a specific episode and version to view detailed patch notes.

The app makes HTTP requests to the backend API and also implements a caching layer to prevent unnecessary network requests.

You can access to the backend repo here: https://github.com/Diegowh/PatchTracker-Backend/

The design of the app is still in its early stages and is subject to changes.

## Installation and Setup

### Prerequisites
* Xcode
* Swift

### Steps
1. Clone the Repository
```
git clone https://github.com/Diegowh/PatchTracker-ios-app.git
```
3. Setup the `Config.plist` file: There is a `Config.example.plist` file in the repository. Use this file as a reference to create your own `COnfig.plist` file. Replace the placeholder values in your new `Config.plist` file with the actual endpoints of the backend API.
4. Open and Run the Project in Xcode: Open the `.xcodeproj` file in Xcode.


## Future Scope

The next stage in the pipeline involves adding League of Legends data to the app and a new user experience focused design for the app.

## Contributions
This project is open to contributions.

## License
This project is licensed under the [MIT License](https://opensource.org/license/mit/) - see the LICENSE file for details.
