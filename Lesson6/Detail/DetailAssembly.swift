import UIKit

struct DetailAssembly {
    
    static func assemble(artist: Artist) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor(artist: artist)
        let router = DetailRouter()
        
        view.output = presenter
        view.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
    }
}
