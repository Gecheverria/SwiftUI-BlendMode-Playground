//
//  ContentView.swift
//  BlendMode
//
//  Created by RAVN on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var demoBlendMode: BlendMode = .normal
    
    @State var randomColor = Color.random(randomOpacity: true)
    
    // MARK: - Main View
    var body: some View {
        NavigationStack {
            List {
                Section("Hands-on") {
                    ForEach(Destination.allCases, id: \.self.rawValue) { destination in
                        NavigationLink(value: destination) {
                            Text(destination.rawValue.capitalized)
                        }
                    }
                }
                
                Section("Random") {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Random Color:")
                                .bold()
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(randomColor)
                                .frame(width: 25, height: 25)
                        }
                        
                        ZStack {
                            Image("random")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            randomColor
                                .blendMode(demoBlendMode)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            demoBlendMode = BlendMode.randomMode
                            randomColor = .random(randomOpacity: true)
                        }
                        
                        Text(demoBlendMode.name)
                            .bold()
                        
                        Text(demoBlendMode.description)
                    }
                }
            }
            .navigationDestination(for: Destination.self, destination: { viewFor(destination: $0) })
            .navigationTitle("Select Section")
            .onAppear {
                demoBlendMode = BlendMode.randomMode
                randomColor = .random(randomOpacity: true)
            }
        }
    }
    
    @ViewBuilder
    func viewFor(destination: Destination) -> some View {
        switch destination {
        case .circles:
            BlendModeView()
        case .examples:
            Examples()
        case .colorGradient:
            GradientView()
        }
    }
}

#Preview {
    ContentView()
}

enum Destination: String, CaseIterable {
    case circles
    case examples
    case colorGradient = "Color Gradient"
}
