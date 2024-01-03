//
//  Extensions.swift
//  BlendMode
//
//  Created by RAVN on 1/2/24.
//

import Foundation
import SwiftUI

public extension Color {
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

extension BlendMode: CustomStringConvertible {
    public static var randomMode: BlendMode {
        let modes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten,
                                     .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion,
                                  .hue, .saturation, .color, .luminosity, .plusDarker, .plusLighter, .destinationOut, .destinationOver, .sourceAtop]
        
        return modes.randomElement() ?? .normal
    }
    
    public var name: String {
        switch self {
        case .normal: "Normal"
        case .multiply: "Multiply"
        case .screen: "Screen"
        case .overlay: "Overlay"
        case .darken: "Darken"
        case .lighten: "Lighten"
        case .colorDodge: "Color Dodge"
        case .colorBurn: "Color Burn"
        case .softLight: "Soft Light"
        case .hardLight: "Hard Light"
        case .difference: "Difference"
        case .exclusion: "Exclusion"
        case .hue: "Hue"
        case .saturation: "Saturation"
        case .color:  "Color"
        case .luminosity: "Luminosity"
        case .sourceAtop: "Source Atop"
        case .destinationOver: "Destination Over"
        case .destinationOut: "Destination Out"
        case .plusDarker: "Plus Darker"
        case .plusLighter: "Plus Lighter"
        @unknown default: "N/A"
        }
    }
    
    // Credits: https://trailingclosure.com/blendmode-cheat-sheet/
    public var description: String {
        switch self {
        case .normal:
            "Default mode. Nothing is blended"
        case .multiply:
            "Multiplies the RBG Channel numbers for each pixel. Result is always a darker picture."
        case .screen:
            "Pixel values are inverted, multiplied and then inverted again. Yields a brighter picture"
        case .overlay:
            "Combines Multiply and Screen blending modes."
        case .darken:
            "Creates a pixel that retains the smallest components of the foreground and background pixels."
        case .lighten:
            "Selects the maximum of each component from the foreground and background pixel"
        case .colorDodge:
            "Divides the bottom layer by the inverted top layer. Lightens the bottom layer depending on the top layer."
        case .colorBurn:
            "Divides the inverted bottom layer by the top layer, and then inverts the result."
        case .softLight:
            "Softer version of overlay. Uses half-strength screen to lighter areas & half-strength multiply to darker areas."
        case .hardLight:
            "Based on the source of color brightness. If it's dark, it uses Screen blending mode, otherwise it applies Multiply blending mode."
        case .difference:
            "Subtracts the bottom layer from the top layer or the other way round, to always get a positive value."
        case .exclusion:
            "Similar to Exclusion blending mode, but lower contrast. Blending with white inverts the base color, but black produces no change."
        case .hue:
            "Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer."
        case .saturation:
            "Peserves the luma and hue of the bottom layer, while adopting the chroma of the top layer."
        case .color:
            "Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer."
        case .luminosity:
            "Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer."
        case .sourceAtop:
            "The source is placed only where it's over the destination."
        case .destinationOver:
            "The destination is placed over the source."
        case .destinationOut:
            "The destination is shown only where it's not underneath the source. Useful for creating an inverse mask effect."
        case .plusDarker:
            "Adds pixel values of one layer with the other then subtracts 1 from the end values."
        case .plusLighter:
            "Adds pixel values of one layer with the other."
        @unknown default: "N/A"
        }
    }
}
