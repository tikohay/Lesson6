//
//  ListMocks.swift
//  Lesson6Tests
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

class ArtistFactoryTest: ArtistFactoryProtocol {
    
    let artists = [Artist(
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
    ), Artist(
        identifier: 2,
        name: "System of a down",
        albums: [
            Album(
                name: "SOAD",
                songs: [
                    Song(name: "Chop suey", duration: 180),
                    Song(name: "Aerials", duration: 227),
                    Song(name: "Toxicity", duration: 254),
                    Song(name: "B.Y.O.B", duration: 205),
                    Song(name: "Lonely day", duration: 365)
                ],
                date: Date(timeIntervalSince1970: 53222400)
            )
        ]
    )]
    
    func getArtistList() -> [Artist] {
        return artists
    }
    
    func getArtistDetail(atIndex index: Int) -> Artist {
        return artists[index]
    }
}

class ArtistServiceTest: ArtistService {
    
    private let artistFactory = ArtistFactoryTest()
    
    func fetchArtistList(_ completion: @escaping ArtistListResult) {
        completion(.success(artistFactory.getArtistList()))
    }
    
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult) {
        completion(.success(artistFactory.getArtistDetail(atIndex: index)))
    }
}

class ListViewMock: ListViewInput {
    
    var output: ListViewOutput?
    var expectation: XCTestExpectation?
    
    var artist: Artist?
    
    func reload(_ artists: [Artist]) {
        artist = artists.first
        expectation?.fulfill()
    }
}

class ListInteractorMock: ListInteractorInput {
    
    let service = ArtistServiceTest()
    var output: ListInteractorOutput?
    
    func obtainArtists() {
        
        service.fetchArtistList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(list):
                self.output?.showResults(list)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func obtainArtist(at index: Int) -> Artist? {
        return nil
    }
}
