import UIKit

class NavigationRouter : Router {
    let navigationController : UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showNewRestaurantScreen() {
        let newRestaurantController = NewRestaurantViewController()

        navigationController.pushViewController(newRestaurantController, animated: true)
    }

    func showRestaurantListScreen() {
        let restaurantListViewController = RestaurantListViewController(router: self, repo: RestaurantRepo())

        navigationController.setViewControllers([restaurantListViewController], animated: true)
    }
}