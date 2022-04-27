//
//  DetailMocks.swift
//  Lesson6Tests
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation
@testable import Lesson6

class DetailViewMock: DetailViewInput {
    
    var artist: DetailViewModel?
    var output: DetailViewOutput?
    
    func upadateDetails(_ details: DetailViewModel) {
        self.artist = details
    }
}

class DetailInteractorMock: DetailInteractorInput {
    
    var output: DetailInteractorOutput?
    private let artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    func obtainDetails() {
        output?.presentDetails(for: artist)
    }
}
