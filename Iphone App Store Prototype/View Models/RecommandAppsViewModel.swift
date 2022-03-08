import Foundation

class RecommandAppsViewModel {
    
    // MARK: - Internal Properties
    var recommandAppsList = [RecommendAppsModel]()
    
    // MARK: - Initializer Methods
    init() { loadRecommendedAppsData() }
    
    // MARK: - Private Methods
    private func loadRecommendedAppsData() {
        recommandAppsList.append(RecommendAppsModel(feature: LocalizedKey.feature.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner1))
        recommandAppsList.append(RecommendAppsModel(feature: LocalizedKey.nowOnMessage.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner2))
    }
}
