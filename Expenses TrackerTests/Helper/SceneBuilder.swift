//
//  ScenceBuilder.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit
@testable import Expenses_Tracker


struct SceneBuilder {
    
    func build(
        expensesAPI: ExpensesAPI = .once([])
    ) throws -> ContainerViewControllerSpy {
        
        ExpensesAPI.shared = expensesAPI
        return ContainerViewControllerSpy(SceneDelegate.main.makeRootViewcontroller())
    }
}

private extension SceneDelegate {
    static var main: SceneDelegate {
        (UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate)
    }
}
