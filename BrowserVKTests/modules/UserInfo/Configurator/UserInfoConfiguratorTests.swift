//
//  UserInfoUserInfoConfiguratorTests.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import XCTest

class UserInfoModuleConfiguratorTests: XCTestCase {

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
        let viewController = UserInfoViewControllerMock()
        let configurator = UserInfoModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "UserInfoViewController is nil after configuration")
        XCTAssertTrue(viewController.output is UserInfoPresenter, "output is not UserInfoPresenter")

        let presenter: UserInfoPresenter = viewController.output as! UserInfoPresenter
        XCTAssertNotNil(presenter.view, "view in UserInfoPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in UserInfoPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is UserInfoRouter, "router is not UserInfoRouter")

        let interactor: UserInfoInteractor = presenter.interactor as! UserInfoInteractor
        XCTAssertNotNil(interactor.output, "output in UserInfoInteractor is nil after configuration")
    }

    class UserInfoViewControllerMock: UserInfoViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
