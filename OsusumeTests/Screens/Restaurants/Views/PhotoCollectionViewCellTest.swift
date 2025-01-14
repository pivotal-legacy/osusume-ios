import XCTest
import Nimble
@testable import Osusume

class PhotoCollectionViewCellTest: XCTestCase {

    func test_deleteButton_exists() {
        let cell = PhotoCollectionViewCell()

        expect(cell.deleteButton).to(beAKindOf(UIButton))
    }

    func test_deleteButton_addedAsSubview() {
        let cell = PhotoCollectionViewCell()

        expect(cell).to(containSubview(cell.deleteButton))
    }

    func test_deleteButton_hasConstraints() {
        let cell = PhotoCollectionViewCell()

        expect(cell.deleteButton).to(hasConstraintsToSuperviewOrSelf())
    }

    func test_configureCell_withImage_hidesDeleteButton() {
        let cell = PhotoCollectionViewCell()


        cell.configureCell(UIImage())


        expect(cell.deleteButton.hidden).to(beTrue())
    }
}