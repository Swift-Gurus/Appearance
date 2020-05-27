//
//  ColorProvider.swift
//  
//
//  Created by Alex Hmelevski on 2020-05-27.
//

import Foundation

#if !os(macOS)
import UIKit
public typealias Color = UIColor
#else
import Cocoa
public typealias Color = NSColor
#endif

public protocol ColorProvider {
    associatedtype ColorType
    init()
    func color(ofType type: ColorType) -> Color
}
