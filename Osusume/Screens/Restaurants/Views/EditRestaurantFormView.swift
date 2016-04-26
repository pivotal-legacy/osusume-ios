import UIKit

class EditRestaurantFormView: UIView {
    // MARK: - View Elements
    let nameHeaderLabel: UILabel
    let nameTextField: UITextField

    let addressHeaderLabel: UILabel
    let addressTextField: UITextField

    let cuisineHeaderLabel: UILabel
    let cuisineValueLabel: UILabel

    let offersEnglishMenuHeaderLabel: UILabel
    let offersEnglishMenuSwitch: UISwitch

    let walkInsOkHeaderLabel: UILabel
    let walkInsOkSwitch: UISwitch

    let acceptsCreditCardsHeaderLabel: UILabel
    let acceptsCreditCardsSwitch: UISwitch

    let notesHeaderLabel: UILabel
    let notesTextView: UITextView

    // MARK: - Initializers
    init(restaurant: Restaurant) {
        nameHeaderLabel = UILabel.newAutoLayoutView()
        nameTextField = UITextField.newAutoLayoutView()
        addressHeaderLabel = UILabel.newAutoLayoutView()
        addressTextField = UITextField.newAutoLayoutView()
        cuisineHeaderLabel = UILabel.newAutoLayoutView()
        cuisineValueLabel = UILabel.newAutoLayoutView()
        offersEnglishMenuHeaderLabel = UILabel.newAutoLayoutView()
        offersEnglishMenuSwitch = UISwitch.newAutoLayoutView()
        walkInsOkHeaderLabel = UILabel.newAutoLayoutView()
        walkInsOkSwitch = UISwitch.newAutoLayoutView()
        acceptsCreditCardsHeaderLabel = UILabel.newAutoLayoutView()
        acceptsCreditCardsSwitch = UISwitch.newAutoLayoutView()
        notesHeaderLabel = UILabel.newAutoLayoutView()
        notesTextView = UITextView.newAutoLayoutView()

        super.init(frame: CGRect())

        addSubviews()
        configureSubviews()
        addConstraints()

        updateUIWithRestaurant(restaurant)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup
    private func addSubviews() {
        self.addSubview(nameHeaderLabel)
        self.addSubview(nameTextField)
        self.addSubview(addressHeaderLabel)
        self.addSubview(addressTextField)
        self.addSubview(cuisineHeaderLabel)
        self.addSubview(cuisineValueLabel)
        self.addSubview(offersEnglishMenuHeaderLabel)
        self.addSubview(offersEnglishMenuSwitch)
        self.addSubview(walkInsOkHeaderLabel)
        self.addSubview(walkInsOkSwitch)
        self.addSubview(acceptsCreditCardsHeaderLabel)
        self.addSubview(acceptsCreditCardsSwitch)
        self.addSubview(notesHeaderLabel)
        self.addSubview(notesTextView)
    }

    private func configureSubviews() {
        nameHeaderLabel.text = "Restaurant Name"
        nameTextField.borderStyle = .Line
        addressHeaderLabel.text = "Address"
        addressTextField.borderStyle = .Line
        cuisineHeaderLabel.text = "Cuisine Type"
        offersEnglishMenuHeaderLabel.text = "Offers English Menu"
        walkInsOkHeaderLabel.text = "Walk-ins Ok"
        acceptsCreditCardsHeaderLabel.text = "Accepts Credit Cards"
        notesHeaderLabel.text = "Notes"
        notesTextView.layer.borderWidth = 1.0
        notesTextView.layer.borderColor = UIColor.darkGrayColor().CGColor
    }

    private func addConstraints() {
        nameHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: self)
        nameHeaderLabel.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        nameHeaderLabel.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: self)
        nameTextField.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        nameTextField.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        nameTextField.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameHeaderLabel)

        addressHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        addressHeaderLabel.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        addressHeaderLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameTextField)
        addressTextField.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        addressTextField.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        addressTextField.autoPinEdge(.Top, toEdge: .Bottom, ofView: addressHeaderLabel)

        cuisineHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        cuisineHeaderLabel.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        cuisineHeaderLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: addressTextField)
        cuisineValueLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        cuisineValueLabel.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        cuisineValueLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: cuisineHeaderLabel)
        cuisineValueLabel.autoSetDimension(.Height, toSize: 25.0)

        offersEnglishMenuHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        offersEnglishMenuHeaderLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: offersEnglishMenuSwitch)
        offersEnglishMenuSwitch.autoPinEdge(.Top, toEdge: .Bottom, ofView: cuisineValueLabel, withOffset: 8.0)
        offersEnglishMenuSwitch.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)

        walkInsOkHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        walkInsOkHeaderLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: walkInsOkSwitch)
        walkInsOkSwitch.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        walkInsOkSwitch.autoPinEdge(.Top, toEdge: .Bottom, ofView: offersEnglishMenuSwitch, withOffset: 8.0)

        acceptsCreditCardsHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        acceptsCreditCardsHeaderLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: acceptsCreditCardsSwitch)
        acceptsCreditCardsSwitch.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        acceptsCreditCardsSwitch.autoPinEdge(.Top, toEdge: .Bottom, ofView: walkInsOkSwitch, withOffset: 8.0)

        notesHeaderLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        notesHeaderLabel.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        notesHeaderLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: acceptsCreditCardsSwitch)

        notesTextView.autoPinEdge(.Leading, toEdge: .Leading, ofView: nameHeaderLabel)
        notesTextView.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: nameHeaderLabel)
        notesTextView.autoPinEdge(.Top, toEdge: .Bottom, ofView: notesHeaderLabel)
        notesTextView.autoSetDimension(.Height, toSize: 66.0)

        notesTextView.autoPinEdgeToSuperviewEdge(.Bottom)
    }

    // MARK: - Getters
    func getNameText() -> String? {
        return nameTextField.text
    }

    func getAddressText() -> String? {
        return addressTextField.text
    }

    func getOffersEnglishMenuState() -> Bool? {
        return offersEnglishMenuSwitch.on
    }

    func getWalkInsOkState() -> Bool? {
        return walkInsOkSwitch.on
    }

    func getAcceptsCreditCardsState() -> Bool? {
        return acceptsCreditCardsSwitch.on
    }

    func getNotesText() -> String? {
        return notesTextView.text
    }

    // MARK: - Private Methods
    private func updateUIWithRestaurant(restaurant: Restaurant) {
        nameTextField.text = restaurant.name
        addressTextField.text = restaurant.address
        cuisineValueLabel.text = restaurant.cuisine.id == 0 ? "" : restaurant.cuisine.name
        offersEnglishMenuSwitch.on = restaurant.offersEnglishMenu
        walkInsOkSwitch.on = restaurant.walkInsOk
        acceptsCreditCardsSwitch.on = restaurant.acceptsCreditCards
        notesTextView.text = restaurant.notes
    }
}

