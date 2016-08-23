import Foundation
import Quick
import Nimble

class FunctionalTests_SharedExamplesTests_SharedExamples: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("a group of three shared examples") {
            it("passes once") { XCTAssertTrue(true) }
            it("passes twice") { XCTAssertTrue(true) }
            it("passes three times") { XCTAssertTrue(true) }
        }

        sharedExamples("shared examples that take a context") { (sharedExampleContext: SharedExampleContext) in
            it("is passed the correct parameters via the context") {
                let callsite = sharedExampleContext()[NSString(string: "callsite")] as! NSString
                XCTAssertEqual(callsite, "SharedExamplesSpec")
            }
        }
    }
}
