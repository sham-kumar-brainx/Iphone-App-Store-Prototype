import Foundation

struct AppsCategoryModel: Hashable {
    
    // MARK: - Internal Properties
    let appName: String
    let appDescription: String
    let appIconImage: String
    let inAppPurchaseStatus: String
}

extension AppsCategoryModel {
    
    // MARK: - Static Properties
    static let allAppsCategories: [AppsCategoryModel] = [
        AppsCategoryModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string),
        AppsCategoryModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string),
        AppsCategoryModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string),
        AppsCategoryModel(appName: LocalizedKey.hungryMessage.string + "1", appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string),
        AppsCategoryModel(appName: LocalizedKey.unsplash.string + "2", appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string),
        AppsCategoryModel(appName: LocalizedKey.noteBook.string + "3", appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string),
        AppsCategoryModel(appName: LocalizedKey.hungryMessage.string + "4", appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string),
        AppsCategoryModel(appName: LocalizedKey.unsplash.string + "5", appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string),
        AppsCategoryModel(appName: LocalizedKey.noteBook.string + "6", appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string)
    ]
}
