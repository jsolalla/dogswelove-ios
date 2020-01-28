# Dogs We Love

The architecture is based on Clean, it is also leveraging MVVM + Coordinator pattern.

### Requirements

* Xcode 11
* iOS 13

### Swift Package Manager

* RxSwift
* RxCocoa
* Nuke
* Moya / RxMoya
* RealmSwift

### Notes

The UI was designed using autolayout via `XIB` files, regarding the Mocks used for this... there was an issue on the dog image dimensions shared on the .pdf, so that was modified accordingly.

Just one Unit Test was added `DogsAPITests`, to show how we can test the API and also use Mock data.

There is one image on the JSON data that has an extra espace, hence it was not a valid URL to display the image, validatons were made in order to show correctly.
