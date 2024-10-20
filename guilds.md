# Create structure

```
lib/
│
├── core/                    # Core configuration & services
│   ├── api/                 # API service and network layer (Dio, REST)
│   ├── constants/           # App-wide constants (theme, routes)
│   ├── models/              # Data models (Freezed, JSON parsing)
│   └── utils/               # Utility functions, helpers (responsive breakpoints, validations)
│
├── features/                # Features directory (modular structure for each feature)
│   ├── dashboard/           # Dashboard feature
│   │   ├── data/            # Data sources (repositories, models specific to dashboard)
│   │   ├── presentation/    # UI components (screens, widgets)
│   │   └── logic/           # Business logic (BLoC, provider, or any state management)
│   │
│   ├── auth/                # Authentication feature
│   │   ├── data/            # API handling, repositories, models
│   │   ├── presentation/    # Login, Signup, Reset Password UI
│   │   └── logic/           # State management (BLoC, Provider, etc.)
│   │
│   └── settings/            # Settings feature
│       ├── data/            # Repositories, models
│       ├── presentation/    # UI components for settings
│       └── logic/           # State management
│
├── shared/                  # Shared components across features
│   ├── widgets/             # Reusable UI widgets (buttons, text fields)
│   ├── styles/              # Reusable styles (themes, colors)
│   ├── services/            # Shared services (e.g., local storage, auth)
│   └── extensions/          # Dart extensions for easier manipulation
│
├── main.dart                # Entry point of the application
└── app.dart                 # App widget, MaterialApp configuration

```



```
mkdir -p lib/{core/{api,constants,models,utils},features/{dashboard/{data,presentation,logic},auth/{data,presentation,logic},settings/{data,presentation,logic}},shared/{widgets,styles,services,extensions}} && \
touch lib/{core/{api/index.dart,constants/index.dart,models/index.dart,utils/index.dart},features/{dashboard/{data/index.dart,presentation/index.dart,logic/index.dart},auth/{data/index.dart,presentation/index.dart,logic/index.dart},settings/{data/index.dart,presentation/index.dart,logic/index.dart}},shared/{widgets/index.dart,styles/index.dart,services/index.dart,extensions/index.dart}}
```




1. https://stackoverflow.com/questions/62442045/page-url-not-changing-in-flutter-but-the-page-content-changes-fine/66182115#66182115
2. GoRouter.optionURLReflectsImperativeAPIs = true;
