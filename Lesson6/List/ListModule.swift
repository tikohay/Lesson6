//
//  ListModule.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ListViewInput: class {

    func reload(_ artists: [Artist])
}

protocol ListViewOutput {

    func viewIsReady()
}

protocol ListInteractorInput {

    func obtainArtists()
    func obtainArtist(at index: Int) -> Artist?
}
protocol ListInteractorOutput: class {

    func showResults(_ results: [Artist])
}

protocol ListRouterInput {

    func goToDetails(artist: Artist)
}

