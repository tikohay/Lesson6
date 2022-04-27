//
//  ListRouter.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListRouter {

    weak var view: UIViewController?
}

extension ListRouter: ListRouterInput {

    func goToDetails(artist: Artist) {
        let details = DetailAssembly.assemble(artist: artist)
        view?.navigationController?.pushViewController(details, animated: true)
    }
}

