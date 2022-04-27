//
//  NetworkService.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ArtistService {
    
    typealias ArtistListResult = (Result<[Artist], Error>) -> ()
    typealias ArtistDetailResult = (Result<Artist, Error>) -> ()
    
    func fetchArtistList(_ completion: @escaping ArtistListResult)
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult)
}

final class ArtistServiceImpl: ArtistService {
    
    private let artistFactory = ArtistFactory()
    
    func fetchArtistList(_ completion: @escaping ArtistListResult) {
        completion(.success(artistFactory.getArtistList()))
    }
    
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult) {
        completion(.success(artistFactory.getArtistDetail(atIndex: index)))
    }
}
