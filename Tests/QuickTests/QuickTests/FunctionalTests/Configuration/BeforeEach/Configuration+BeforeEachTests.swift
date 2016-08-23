import XCTest
import Quick
import Nimble

class Configuration_BeforeEachSpec: QuickSpec {
    override func spec() {
        it("is executed after the configuration beforeEach") {
            XCTAssertTrue(FunctionalTests_Configuration_BeforeEachWasExecuted)
        }
    }
}

final class Configuration_BeforeEachTests: XCTestCase, XCTestCaseProvider {
    static var allTests: [(String, (Configuration_BeforeEachTests) -> () throws -> Void)] {
        return [
            ("testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted", testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted),
        ]
    }

    func testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted() {
        FunctionalTests_Configuration_BeforeEachWasExecuted = false

        qck_runSpec(Configuration_BeforeEachSpec.self)
        XCTAssert(FunctionalTests_Configuration_BeforeEachWasExecuted)

        FunctionalTests_Configuration_BeforeEachWasExecuted = false
    }
}
