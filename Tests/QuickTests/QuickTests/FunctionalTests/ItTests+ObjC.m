@import XCTest;
@import Quick;
@import Nimble;

#import "QCKSpecRunner.h"
#import "QuickSpec+QuickSpec_MethodList.h"

QuickSpecBegin(FunctionalTests_ItSpec_ObjC)

__block ExampleMetadata *exampleMetadata = nil;
beforeEachWithMetadata(^(ExampleMetadata *metadata) {
    exampleMetadata = metadata;
});

it(@" ", ^{
    XCTAssertEqual(exampleMetadata.example.name, @" ");
});

it(@"has a description with セレクター名に使えない文字が入っている 👊💥", ^{
    NSString *name = @"has a description with セレクター名に使えない文字が入っている 👊💥";
    XCTAssertEqual(exampleMetadata.example.name, name);
});

it(@"is a test with a unique name", ^{
    NSSet<NSString*> *allSelectors = [FunctionalTests_ItSpec_ObjC allSelectors];

    XCTAssertTrue([allSelectors containsObject:@"is_a_test_with_a_unique_name"]);
    XCTAssertFalse([allSelectors containsObject:@"is_a_test_with_a_unique_name_2"]);
});

QuickSpecEnd

@interface ItTests_ObjC : XCTestCase; @end

@implementation ItTests_ObjC

- (void)testAllExamplesAreExecuted {
    XCTestRun *result = qck_runSpec([FunctionalTests_ItSpec_ObjC class]);
    XCTAssertEqual(result.executionCount, 3);
}

@end
