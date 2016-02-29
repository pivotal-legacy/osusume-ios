import Foundation
import BrightFutures
@testable import Osusume

class FakeRestaurantRepo : RestaurantRepo {
    var createdRestaurant : Restaurant? = nil
    var allRestaurants : [Restaurant] = []

    var restaurantsPromise = Promise<[Restaurant], RepoError>()
    func getAll() -> Future<[Restaurant], RepoError> {
        restaurantsPromise.success(allRestaurants)
        return restaurantsPromise.future
    }

    var create_args : NewRestaurant!
    func create(newRestaurant: NewRestaurant) -> Future<[String: AnyObject], RepoError> {
        let promise = Promise<[String: AnyObject], RepoError>()
        promise.success([String: AnyObject]())

        create_args = newRestaurant

        return promise.future
    }

    var restaurantPromise = Promise<Restaurant, RepoError>()
    func getOne(id: Int) -> Future<Restaurant, RepoError> {
        restaurantPromise.success(createdRestaurant!)
        return restaurantPromise.future
    }

    func update(id: Int, params: [String: AnyObject]) -> Future<[String: AnyObject], RepoError> {
        let promise = Promise<[String: AnyObject], RepoError>()
        promise.success([String: AnyObject]())

        createdRestaurant = Restaurant(id: 0,
            name: params["name"] as! String,
            address: params["address"] as! String,
            cuisineType: params["cuisine_type"] as! String,
            offersEnglishMenu: params["offers_english_menu"] as! Bool,
            walkInsOk: params["walk_ins_ok"] as! Bool,
            acceptsCreditCards: params["accepts_credit_cards"] as! Bool,
            notes: params["notes"] as! String,
            author: "Fake user",
            createdAt: NSDate(),
            photoUrls: [],
            comments: []
        )

        return promise.future
    }
}