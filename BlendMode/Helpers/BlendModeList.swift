//
//  BlendModeList.swift
//  BlendMode
//
//  Created by RAVN on 12/27/23.
//

import SwiftUI

struct BlendModeSections {
    let title: String
    let blendModes: [BlendMode]
}

struct BlendModeList: View {
    let sections: [BlendModeSections] = [
        .init(title: "Normal", blendModes: [.normal]),
        .init(title: "Lighten", blendModes: [.colorDodge, .lighten, .screen, .plusLighter]),
        .init(title: "Darken", blendModes: [.colorBurn, .darken, .multiply, .plusDarker]),
        .init(title: "Contrast", blendModes: [.overlay, .softLight, .hardLight]),
        .init(title: "Component", blendModes: [.hue, .saturation, .color, .luminosity]),
        .init(title: "Compositing", blendModes: [.sourceAtop, .destinationOver, .destinationOut]),
        .init(title: "Invert", blendModes: [.difference, .exclusion,])
    ]
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedBlendMode: BlendMode
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sections, id: \.title) { section in
                    Section(section.title) {
                        ForEach(section.blendModes, id: \.name) { blendMode in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(blendMode.name)
                                    
                                    Text(blendMode.description)
                                        .font(.footnote)
                                        .foregroundStyle(Color.gray)
                                }
                                
                                Spacer()
                                
                                if selectedBlendMode == blendMode {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Color.blue)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedBlendMode = blendMode
                                
                                dismiss()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Select Blend Mode")
        }
    }
}

#Preview {
    BlendModeList(selectedBlendMode: .init(get: { .colorDodge }, set: {_ in }))
}
