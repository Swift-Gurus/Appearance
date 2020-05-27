//
//  AppearanceRegistrable.swift
//  
//
//  Created by Alex Hmelevski on 2020-05-27.
//

import Foundation

public protocol AppearanceRegistrable {
    static var id: String { get }
}

public extension AppearanceRegistrable {
    static var id: String {
        return "\(self)"
    }
}
