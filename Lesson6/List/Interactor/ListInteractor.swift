//
//  ListInteractor.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ListInteractor {
    
    weak var output: ListInteractorOutput?
    private let service: ArtistService
    
    private var artistList: [Artist] = []
    
    init(service: ArtistService) {
        self.service = service
    }
}

extension ListInteractor: ListInteractorInput {
    
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
        guard index < artistList.count else { return nil }
        return artistList[index]
    }
}

