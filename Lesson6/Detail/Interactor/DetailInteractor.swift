import Foundation

final class DetailInteractor {
    
    weak var output: DetailInteractorOutput?
    
    private let artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
}

extension DetailInteractor: DetailInteractorInput {
    
    func obtainDetails() {
        output?.presentDetails(for: artist)
    }
}
