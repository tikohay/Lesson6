//
//  ListPresenter.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListPresenter: NSObject {
    
    weak var view: ListViewInput?
    var router: ListRouterInput?
    var interactor: ListInteractorInput?
}

extension ListPresenter: ListViewOutput {
    
    func viewIsReady() {
        interactor?.obtainArtists()
    }
}

extension ListPresenter: ListInteractorOutput {
    func showResults(_ results: [Artist]) {
        view?.reload(results)
    }
}
