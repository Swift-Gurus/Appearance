//
//  GenericTheme.swift
//  
//
//  Created by Alex Hmelevski on 2020-05-27.
//

import Foundation


public protocol Theme: ColorProvider, FontProvider {
    
}


public final class GenericTheme<
FontsProvider: FontProvider,
ColorsProvider: ColorProvider>: Theme {

    public typealias FontType = FontsProvider.FontType
    public typealias ColorType = ColorsProvider.ColorType
    
    let fontsProvider: FontsProvider
    let colorProvider: ColorsProvider
    
    public init(fontsProvider: FontsProvider,
                colorProvider: ColorsProvider) {
        self.fontsProvider = fontsProvider
        self.colorProvider = colorProvider
    }
    
    public func font(ofType type: FontType) -> Font {
        fontsProvider.font(ofType: type)
    }
    
    public func color(ofType type: ColorType) -> Color {
        colorProvider.color(ofType: type)
    }
   
}
