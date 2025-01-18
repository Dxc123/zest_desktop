# zest_desktop

A new Flutter project.

## Getting Started

### 1.getx 国际化、get_cli生成国际化文件:

在 assets/locales 目录创建 json 格式的语言文件:
zh_CN.json
en_US.json

命令：get generate locales assets/locales

### 2.使用flutter_intl插件(vscode/Android Studio)国际化

```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

### 3. 使用json_serializable、freezed 库序列化 json

```
get install json_annotation
get install json_serializable --dev
get install freezed_annotation
get install freezed --dev
```


// https://dartj.web.app/  json生成对应 model

/// 有数据模型更新要执行下面语句 =>>

/// dart run build_runner build

/// dart run build_runner build --delete-conflicting-outputs

### 4.使用 pub库管理Flutter assets资源

get install flutter_gen

get install flutter_gen_runner --dev

flutter_asset_generator库

### 5.使用插件管理Flutter assets资源

FlutterAssetsGenerator插件(Android Studio)会自动生成 `lib/generated/assets.dart文件`

Flutter Assets Gen插件(vscode) 可在 yaml文件自定输出文件路径

命令

* `Flutter Assets: Watch`
* `Flutter Assets: Stop Watch`
* `Flutter Assets: Generate`

assets图片管理（ 针对生成1 倍 2 倍 3 倍)

FlutterAddImage插件(Android Studio)导入一个3倍的图片,自动生成 1倍 2倍的

Flutter GetX Generator - 猫哥插件(vscode) 添加一个3倍的图片，生成 1倍 2倍的图
