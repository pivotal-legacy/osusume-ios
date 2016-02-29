import Foundation
import Result

enum RestaurantParseError: ErrorType {
    case InvalidField
}

struct RestaurantParser {

    func parseList(json: [[String: AnyObject]]) -> Result<[Restaurant], RestaurantParseError> {
        let restaurantArray = json.flatMap { r in privateParseSingle(r) }

        return Result.Success(restaurantArray)
    }

    func parseSingle(json: [String: AnyObject]) -> Result<Restaurant, RestaurantParseError> {

        if let restaurant = privateParseSingle(json) {
            return Result.Success(restaurant)
        }

        return Result.Failure(RestaurantParseError.InvalidField)
    }

    private func privateParseSingle(json: [String: AnyObject]) -> Restaurant? {
        guard
            let id = json["id"] as? Int,
            let name = json["name"] as? String
            else {
                return nil
        }

        let maybeAddress = json["address"] as? String
        let address = maybeAddress ?? ""

        let maybeCuisineType = json["cuisine_type"] as? String
        let cuisineType = maybeCuisineType ?? ""

        let maybeOffersEnglishMenu = json["offers_english_menu"] as? Bool
        let offersEnglishMenu = maybeOffersEnglishMenu ?? false

        let maybeWalkInsOk = json["walk_ins_ok"] as? Bool
        let walkInsOk = maybeWalkInsOk ?? false

        let maybeAcceptCreditCard = json["accepts_credit_cards"] as? Bool
        let acceptCreditCard = maybeAcceptCreditCard ?? false

        let maybeNotes = json["notes"] as? String
        let notes = maybeNotes ?? ""

        let maybeUserJson = json["user"] as? [String: AnyObject]
        let maybeUserName = maybeUserJson?["name"] as? String
        let userName = maybeUserName ?? ""

        let maybeCreatedAt = json["created_at"] as? Double
        let createdAtEpoch: Double? = maybeCreatedAt ?? nil
        var createdAt: NSDate? = nil
        if let actualCreatedAt = createdAtEpoch {
            createdAt = NSDate(timeIntervalSince1970: actualCreatedAt)
        }

        let maybePhotoUrlsJson = json["photo_urls"] as? [[String: AnyObject]]
        let photoUrls = maybePhotoUrlsJson ?? []
        let urls: [NSURL] = photoUrls.flatMap { photoUrlJson in
            return NSURL(string: photoUrlJson["url"] as? String ?? "")
        }

        let maybeCommentsJson = json["comments"] as? [[String: AnyObject]]
        let commentsJson = maybeCommentsJson ?? []
        let comments: [PersistedComment] = commentsJson.flatMap { commentJson in
            let parseResult = CommentParser().parse(commentJson)
            return parseResult.value
        }

        return Restaurant(
            id: id,
            name: name,
            address: address,
            cuisineType: cuisineType,
            offersEnglishMenu: offersEnglishMenu,
            walkInsOk: walkInsOk,
            acceptsCreditCards: acceptCreditCard,
            notes: notes,
            author: userName,
            createdAt: createdAt,
            photoUrls: urls,
            comments: comments
        )
    }
}
