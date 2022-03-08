import Foundation

class GameTopicViewModel {
    
    // MARK: - Internal Properties
    var gameTopicList = [GameTopicModel]()
    
    // MARK: - Initializer Methods
    init() {
        if gameTopicList.isEmpty {
            loadGameTopicData()
        }
    }
    
    // MARK: - Private Methods
    private func loadGameTopicData() {
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.hungryMessage.string, appDescription: LocalizedKey.exploreWorld.string, appIconImage: Images.appIcon1, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.unsplash.string, appDescription: LocalizedKey.photosForEveryOne.string, appIconImage: Images.appIcon2, inAppPurchaseStatus: LocalizedKey.emptyString.string))
        gameTopicList.append(GameTopicModel(appName: LocalizedKey.noteBook.string, appDescription: LocalizedKey.takeNotes.string, appIconImage: Images.appIcon3, inAppPurchaseStatus: LocalizedKey.inAppPurchase.string))
    }
}
