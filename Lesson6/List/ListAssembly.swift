//
//  ListAssembly.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

struct ListAssembly {
    
    static func assemble() -> UIViewController {
        let view = ListViewController()
        let presenter = ListPresenter()
        let artistService = ArtistServiceImpl()
        let interactor = ListInteractor(service: artistService)
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
    }
}
