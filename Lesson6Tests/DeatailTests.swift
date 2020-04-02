import XCTest
@testable import Lesson6

final class DeatailTests: XCTestCase {

  func testDetailAssembly() {
    let sut = DetailAssembly.assemble(artistId: 0)

    XCTAssert(sut is DetailViewController)
    XCTAssertNotNil((sut as! DetailViewController).router)
    XCTAssertNotNil((sut as! DetailViewController).output)
  }

  func testDetailAssemblyInitialization() {
    let sut = DetailAssembly()

    XCTAssertNotNil(sut)
  }
}
