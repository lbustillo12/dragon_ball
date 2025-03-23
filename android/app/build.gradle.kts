plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.dragon_ball"  // Cambia esto al package name de tu app
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"  // Usa la versión más reciente del NDK

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.dragon_ball"  // Cambia esto al ID de tu app
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Configuración de firma para la versión de lanzamiento
            signingConfig = signingConfigs.getByName("debug")  // Cambia esto para producción
        }
    }
}

flutter {
    source = "../.."
}
