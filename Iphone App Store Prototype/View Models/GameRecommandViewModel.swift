import Foundation

class GameRecommandViewModel {
    
    // MARK: - Internal Properties
    var gameRecommandList = [GameRecommendModel]()
    
    // MARK: - Initializer Methods
    init() {
        if gameRecommandList.isEmpty {
            loadRecommendedGameData()
        }
    }
    
    // MARK: Private Methods
    private func loadRecommendedGameData() {
        gameRecommandList.append(GameRecommendModel(feature: LocalizedKey.feature.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner1))
        gameRecommandList.append(GameRecommendModel(feature: LocalizedKey.nowOnMessage.string, appName: LocalizedKey.marvelAvengers.string, appDescription: LocalizedKey.yourFavouriteHeroes.string, appIconImage: Images.banner2))
    }
}
