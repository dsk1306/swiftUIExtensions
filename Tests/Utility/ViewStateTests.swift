@testable import SwiftUIExtensions
import XCTest

final class ViewStateTests: XCTestCase {

    // MARK: - Properties

    private let transform: (Int) -> String = {
        "\($0)"
    }

    // MARK: - Tests

    func test_value() {
        let value = 10
        XCTAssertEqual(ViewState.success(value).value, value)
    }

    func test_noValue() {
        XCTAssertNil(ViewState.empty.value)
        XCTAssertNil(ViewState.loading.value)
        XCTAssertNil(ViewState.failure(nil).value)
        XCTAssertNil(ViewState.failure(Mock.errorText).value)
    }


    func test_map() {
        XCTAssertEqual(ViewState.empty.map(transform), .empty)
        XCTAssertEqual(ViewState.loading.map(transform), .loading)
        XCTAssertEqual(ViewState.failure(nil).map(transform), .failure(nil))
        XCTAssertEqual(ViewState.failure(Mock.errorText).map(transform), .failure(Mock.errorText))
        XCTAssertEqual(ViewState.success(1).map(transform), .success("1"))
    }

    func test_init_successArray_value() {
        let array = [1, 2, 3]

        XCTAssertEqual(ViewState(successArray: array), .success(array))
    }

    func test_init_successArray_empty() {
        let array = [Int]()

        XCTAssertEqual(ViewState(successArray: array), .empty)
    }

}

// MARK: - Mock

private extension ViewStateTests {

    enum Mock {

        static let errorText = "Test Error"

    }

}
