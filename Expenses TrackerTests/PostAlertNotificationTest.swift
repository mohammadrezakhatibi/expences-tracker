//
//  PostAlertNotificationTest.swift
//  Expenses TrackerTests
//
//  Created by Mohammadreza on 8/4/22.
//

import XCTest
@testable import Expenses_Tracker

class PostAlertNotificationTest: XCTestCase {

    
    func test_postOne_generatesANotification() throws {
        
        // Given
        let vc = UIViewController()
        let exp = expectation(
            forNotification: Notification.Name.AlertNotification,
            object: vc,
            handler: nil)
        
        // When
        vc.postNotification()
        
        // Then
        wait(for: [exp], timeout: 1)
        
    }

}
