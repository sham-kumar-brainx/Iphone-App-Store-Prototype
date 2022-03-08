import Foundation

class AppsCategoryViewModel {
    
    // MARK: - Internal Properties
    var appsCategoryList = [AppsCategoryModel]()
    
    // MARK: - Initializer Methods
    init() { loadAppsCategoryData() }
    
    // MARK: - Private Methods
    private func loadAppsCategoryData() {
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        appsCategoryList.append(AppsCategoryModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
    }
}
