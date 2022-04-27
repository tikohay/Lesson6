import XCTest
@testable import Lesson6

final class DetailPresenterTests: XCTestCase {
    
    let artist = Artist(
        identifier: 1,
        name: "John Lennon",
        albums: [
            Album(
                name: "Imagine",
                songs: [
                    Song(name: "Imagine", duration: 180),
                    Song(name: "Crippled Inside", duration: 227),
                    Song(name: "Jealous Guy", duration: 254),
                    Song(name: "It's So Hard", duration: 205),
                    Song(name: "I Don't Want to Be a Soldier", duration: 365),
                    Song(name: "Gimme Some Truth", duration: 196),
                    Song(name: "Oh My Love", duration: 170),
                    Song(name: "How Do You Sleep?", duration: 336),
                    Song(name: "How?", duration: 223),
                    Song(name: "Oh Yoko!", duration: 260)
                ],
                date: Date(timeIntervalSince1970: 53222400)
            )
        ]
    )
    
    var view: DetailViewMock!
    var interactor: DetailInteractorMock!
    var sut: DetailPresenter!
    
    override func setUp() {
        super.setUp()
        
        view = DetailViewMock()
        interactor = DetailInteractorMock(artist: artist)
        sut = DetailPresenter()
        
        view.output = sut
        sut.view = view
        sut.interactor = interactor
        interactor.output = sut
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testAssemble() {
        view.output = sut
        sut.view = view
        sut.interactor = interactor
        interactor.output = sut
    }
    
    func testViewIsReady() {
        view.output?.viewIsReady()
        XCTAssertEqual(view.artist?.artistName, "John Lennon")
    }
}
