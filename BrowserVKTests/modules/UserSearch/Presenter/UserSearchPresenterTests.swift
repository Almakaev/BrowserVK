//
//  UserSearchUserSearchPresenterTests.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import XCTest

class UserSearchPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: UserSearchInteractorInput {

    }

    class MockRouter: UserSearchRouterInput {

    }

    class MockViewController: UserSearchViewInput {

        func setupInitialState() {

        }
    }
}
