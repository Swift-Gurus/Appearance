//
//  FontsProvider.swift
//  
//
//  Created by Alex Hmelevski on 2020-05-27.
//

import Foundation

#if !os(macOS)
import UIKit
public typealias Font = UIFont
#else
import Cocoa
public typealias Font = NSFont
#endif


public protocol FontProvider {
    associatedtype FontType
    func font(ofType type: FontType) -> Font
}
