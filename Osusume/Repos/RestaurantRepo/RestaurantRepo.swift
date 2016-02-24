import BrightFutures

protocol RestaurantRepo : class {
    func getAll() -> Future<[Restaurant], RepoError>

    func getOne(id: Int) -> Future<Restaurant, RepoError>

    func create(restaurantForm: NewRestaurant) -> Future<[String: AnyObject], RepoError>

    func update(id: Int, params: [String: AnyObject]) -> Future<[String: AnyObject], RepoError>
}