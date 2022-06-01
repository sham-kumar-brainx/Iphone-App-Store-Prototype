import Foundation

enum LocalizedKey: String {
    
    // MARK: - Internal Properties
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    // MARK: - Enum cases
    case emptyString = ""
    case ok = "OK"
    case error = "error"
    case success = "Success"
    case orientation = "orientation"
    case somethingWentWrong = "Something went wrong"
    case feature = "FEATURED"
    case nowOnMessage = "NOW ON IMESSAGE"
    case marvelAvengers = "Marvel Avengers: Infinity War"
    case yourFavouriteHeroes = "Your Favourite heroes, assembled"
    case hungryMessage = "My Very Hungry Caterpillar…"
    case exploreWorld = "Explore the world together"
    case inAppPurchase = "In-App Purchases"
    case get = "GET"
    case appsTitle = "Apps"
    case unsplash = "Unsplash"
    case photosForEveryOne = "Photos for everyone"
    case noteBook = "Noted: Notebook, Audio…"
    case takeNotes = "Take Notes, Meeting Minutes"
}
