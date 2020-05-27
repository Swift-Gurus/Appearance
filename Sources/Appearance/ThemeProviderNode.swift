//
//  ThemeProviderNode.swift
//  
//
//  Created by Alex Hmelevski on 2020-05-27.
//

import Foundation


public protocol ThemeProvider {
    associatedtype T: Theme
    func theme(for appearanceType: AppearanceRegistrable.Type) -> T
}

open class ThemeProviderNode<
    FontsProvider: FontProvider,
    ColorsProvider: ColorProvider>: ThemeProvider {
    public typealias T = GenericTheme<FontsProvider,ColorsProvider>
    
    var next: ThemeProviderNode<FontsProvider,ColorsProvider>?
  
    public required init() {
        
    }
    
    public static func createChain(from providerTypes: [ThemeProviderNode.Type]) -> ThemeProviderNode {
        var lastProvider: ThemeProviderNode?
        for type in providerTypes.reversed() {
            let existingProvider = lastProvider
            lastProvider = type.init()
            lastProvider?.next = existingProvider
        }
        guard let provider = lastProvider else { fatalError("Cannot create chain") }
        return provider
    }
    
    public func theme(for appearanceType: AppearanceRegistrable.Type) -> T {
        guard  let nextProvider = next else { fatalError("Not found for \(appearanceType)") }
        return nextProvider.theme(for: appearanceType)
    }
}
