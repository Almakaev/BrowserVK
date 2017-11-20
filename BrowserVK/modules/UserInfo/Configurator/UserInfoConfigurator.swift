//
//  UserInfoUserInfoConfigurator.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

class UserInfoModuleConfigurator {

//    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
//
//        if let viewController = viewInput as? UserInfoViewController {
//            configure(viewController: viewController)
//        }
//    }

    func configure(viewController: UserInfoViewController, userID: Int) -> UserInfoViewController {

        let router = UserInfoRouter()

        let presenter = UserInfoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = UserInfoInteractor()
        interactor.output = presenter
        
        let apiFacade = ApiFacade()
        apiFacade.interactorUserInfo = interactor
        interactor.apiFacade = apiFacade

        presenter.interactor = interactor
        presenter.interactor.userId = userID
        viewController.output = presenter
        
        return viewController
    }

}
