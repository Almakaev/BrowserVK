//
//  UserSearchUserSearchConfiguratorTests.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import XCTest

class UserSearchModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = UserSearchViewControllerMock()
        let configurator = UserSearchModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "UserSearchViewController is nil after configuration")
        XCTAssertTrue(viewController.output is UserSearchPresenter, "output is not UserSearchPresenter")

        let presenter: UserSearchPresenter = viewController.output as! UserSearchPresenter
        XCTAssertNotNil(presenter.view, "view in UserSearchPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in UserSearchPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is UserSearchRouter, "router is not UserSearchRouter")

        let interactor: UserSearchInteractor = presenter.interactor as! UserSearchInteractor
        XCTAssertNotNil(interactor.output, "output in UserSearchInteractor is nil after configuration")
    }

    class UserSearchViewControllerMock: UserSearchViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
