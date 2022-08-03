//
//  NSError.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation

extension NSError {
    convenience init(localizedDescription: String) {
        self.init(domain: "Test", code: 0, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
}
