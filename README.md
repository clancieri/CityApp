# CityApp

CityApp is an iOS application that allows users to search for cities and manage a list of favorites.

## Technical Stack
- SwiftUI
- Combine
- Async/await
- Unit tests coverage
- Protocol-oriented dependency injection

## Architecture
![alt text](https://github.com/clancieri/CityApp/blob/main/architecture.png "")

## Search Implementation
The app implements a Trie (prefix tree) data structure for efficient city name searches with the following characteristics: 

- Filter results by a given prefix ✅
- Optimize for fast searches ✅
- Support case-insensitive ✅

This ensures a fast and scalable search experience, especially important when dealing with large datasets of cities. 

```swift
Root
├── l
│   ├── i
│   │   ├── s
│   │   │   ├── b
│   │   │   │   └── o
│   │   │   │       └── a
│   ├── i
│   │   ├── m
│   │   │   └── a
```
Components:
- TrieNode: Stores character relationships and associated cities
- CityTrie: Manages insertion and search operations

## 📸 Screenshots & Layout Behavior
To provide an adaptive user experience using native SwiftUI components, CityApp leverages NavigationSplitView on larger devices (such as iPhone Pro Max and Plus models). This allows users to view both the list of cities and the map side by side when the device is in landscape orientation.

For smaller devices, the app falls back to a standard NavigationStack, enabling seamless navigation between views without splitting the screen.

<img src="https://github.com/user-attachments/assets/66794c1f-4178-4c16-9e24-de447aa08919" width="320">
<img src="https://github.com/user-attachments/assets/88fe10df-c9c7-40e9-91d7-56adbed131bc" width="320">
<img src="https://github.com/user-attachments/assets/667421a8-eac0-402d-9af4-fc5cc1418278" width="320">

## Installation

1. Clone the repository
2. Open CityApp.xcodeproj in Xcode
3. Build and run the project

```swift
git clone https://github.com/clancieri/CityApp.git
```
