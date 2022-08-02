//
//  UINavigationMakeNavTest.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import XCTest
@testable import Expenses_Tracker

final class UINavigationMakeNavTest: XCTestCase {
    
    var sut: UIViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        initialVC()
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    private func initialVC() {
        let vc = UIViewController()
        sut = vc.makeNav(title: "Test", image: "folder")
    }

    func test_makeNav_title() {
        XCTAssertEqual(sut.tabBarItem.title, "Test")
    }
    func test_makeNav_image() {
        XCTAssertEqual(sut.tabBarItem!.image, UIImage(
            systemName: "folder",
            withConfiguration: UIImage.SymbolConfiguration(scale: .large)))
    }
}
