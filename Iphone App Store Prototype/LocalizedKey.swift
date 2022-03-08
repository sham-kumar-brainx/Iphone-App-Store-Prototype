import Foundation

enum LocalizedKey: String {
    
    // MARK: Internal Properties
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    // MARK: Enum cases
    case emptyString = ""
    case ok = "OK"
    case error = "error"
    case field = "field"
    case errors = "errors"
    case message = "message"
    case success = "Success"
    case urlNotFound = "Url not found"
    case somethingWentWrong = "Something went wrong"
    case failedToParseData = "Failed to parse data"
    case userFriendlyErrorMessage = "No or Slow Internet. Please check your internet connection and try again. Thanks"
    case orientation = "orientation"
    case meditation = "MEDITATION"
    case moods = "MOODS"
    case more = "MORE"
    case onboarding1Heading = "See Your Daily Meditation"
    case onboarding1Description = "For Your Personalized Mood"
    case onboarding2Heading = "View Your Mood Base Solutions"
    case onboarding2Description = "An interactive tracking calendar"
    case onboarding3Heading = "Way to Go!"
    case upcomingEvent = "Upcoming Event"
    case donateNow = "Donate Now"
    case contactUs = "Contact Us"
    case pastMeditation = "Past Meditation"
    case biochemicalBalance = "Biochemical Balance"
    case balancedHealingVideos = "Balanced Healing Videos"
    case freeRecoveryNutritionConsultation = "Free Recovery Nutrition Consultation"
    case privacyPolicy = "Privacy Policy"
    case silentPushIdentifier = "SilentPushIdentifier"
    case pushIdentifier = "PushIdentifier"
    case suggestion = "Suggestion "
    case moodsDescription = "Tell us how you are feeling today and we will share some suggestions. Select all that apply."
    case moreActionView = "MoreActionView"
    case notDequeueableCell = "Unable to dequeue MoodsTableViewCell"
    case noneError = "Should not be none"
}
