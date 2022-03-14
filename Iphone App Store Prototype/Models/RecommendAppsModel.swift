import Foundation

struct RecommendAppsModel: Hashable {
    
    // MARK: - Internal Properties
    let feature: String
    let appName: String
    let appDescription: String
    let appIconImage: String
}

extension RecommendAppsModel {
    static let allRecommendedApps: [RecommendAppsModel] = [
        RecommendAppsModel(feature: LocalizedKey.feature.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner1),
        RecommendAppsModel(feature: LocalizedKey.nowOnMessage.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner2)
    ]
}
