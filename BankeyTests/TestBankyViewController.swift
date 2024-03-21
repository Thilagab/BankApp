//
//  TestBankyViewController.swift
//  BankeyTests
//
//  Created by Thilagawathy Duraisamy on 20/3/2024.
//

import XCTest
@testable import Bankey

class TestBankyViewController: XCTestCase {

    var vc: LoginViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        vc = LoginViewController()
        vc.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testLoginViewShouldBeVisisble() throws {
        let isViewLoaded = vc.isViewLoaded
        XCTAssertTrue(isViewLoaded, "Login View not able to load in Login ViewController")
    }
   

}
