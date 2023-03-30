import XCTest
import SwiftUI
@testable import PopupView

final class PopupViewTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let rect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        
        let view = PopupViewNew.shared.setupView(header: .init(version: .classic, header: "1"), view: UIView(), frame: rect)
        XCTAssertNotNil(view)
    }
    
    func testRemoveLast() {
        XCTAssertNoThrow(PopupViewNew.shared.exitPopUp())
    }
}
