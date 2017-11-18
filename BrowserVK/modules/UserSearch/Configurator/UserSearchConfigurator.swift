//
//  UserSearchUserSearchConfigurator.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

class UserSearchModuleConfigurator {

//    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
//
//        if let viewController = viewInput as? UserSearchViewController {
//            configure(viewController: viewController)
//        }
//    }

    func configure(viewController: UserSearchViewController) -> UIViewController {

        let router = UserSearchRouter()

        let presenter = UserSearchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = UserSearchInteractor()
        interactor.output = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)

        presenter.interactor = interactor
        viewController.output = presenter
        
        return navigation
    }

}
