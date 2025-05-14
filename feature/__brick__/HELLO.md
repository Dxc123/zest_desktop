└── lib/
└── features/
└── {{name}}/
├── data/
│   ├── datasources/
│   │   └── {{name}}_remote_datasource.dart
│   ├── models/
│   │   └── {{name}}_model.dart
│   └── repositories/
│       └── {{name}}_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── {{name}}.dart
│   ├── repositories/
│   │   └── {{name}}_repository.dart
│   └── usecases/
│       └── get_{{name}}.dart
└── presentation/
├── bloc/
│   └── {{name}}_bloc.dart
├── pages/
│   └── {{name}}_page.dart
└── widgets/
└── {{name}}_widget.dart