# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.abdelhamid.myapp
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "9675B7E9F12155807699E62C187EDC66004C21361C7616688A85FAE9F701925F222B66B1D51068A3E168A1B76CA1622774BD80CBCB700DF5F75751E974E8DADBEF2520010F87FDFCF690E4534C9AF1F71B5FE22E0F8F5B8225F052D221C387EC5199C0959B72ECC4906F37033A35F7D35CE481EA2FEB01BFD489FA711D6B144DBD62A4769EB1DA760B6118C5856CBD62B4C10E5CAF7F9D462D8EE704B73E60DEA0552293A9CB78CF11CF931B0D5451911FF5A665A9200B46AC209E0DBB28B989CA0C64E61D15186C8E2DF705196F4BEF29D3A567BA4D0C8793A02DC0DCCC02B334A28F0B8B1330C5DD4F62743A35377162FF22A7925CEF3CB5B8B88DA5E3CDFFC0B980F22FD79AA7C8ACFBCAC4E286082C2FCBE410479BA7C8759D331A233C5BB6B983B6A6B855655AADD439BD3B9B99"

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

# RESOURCES += resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}
