pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

// flutter_tesseract_ocr 0.4.31 вызывает jcenter(), которого нет в Gradle 9.
// Подменяем его android/build.gradle на патч из репозитория до загрузки плагинов.
val tesseractBuildGradle =
    file("${System.getProperty("user.home")}/.pub-cache/hosted/pub.dev/flutter_tesseract_ocr-0.4.31/android/build.gradle")
val tesseractPatch = file("gradle/flutter_tesseract_ocr.build.gradle")
if (tesseractBuildGradle.exists() && tesseractPatch.exists()) {
    tesseractBuildGradle.writeText(tesseractPatch.readText())
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "9.0.1" apply false
    id("com.android.library") version "9.0.1" apply false
    id("org.jetbrains.kotlin.android") version "2.3.20" apply false
}

include(":app")
