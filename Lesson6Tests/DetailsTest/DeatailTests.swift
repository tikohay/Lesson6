import XCTest
@testable import Lesson6

final class DeatailTests: XCTestCase {
    
    let artist = Artist(identifier: 0,
                        name: "a",
                        albums: [.init(name: "a",
                                       songs: [.init(name: "a", duration: 0)],
                                       date: Date(timeIntervalSince1970: 53222400))])
    
    func testDetailAssembly() {
        let sut = DetailAssembly.assemble(artist: artist)
        
        XCTAssert(sut is DetailViewController)
        XCTAssertNotNil((sut as! DetailViewController).router)
        XCTAssertNotNil((sut as! DetailViewController).output)
    }
}
