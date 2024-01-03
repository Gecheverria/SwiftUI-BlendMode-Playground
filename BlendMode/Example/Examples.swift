//
//  Examples.swift
//  BlendMode
//
//  Created by Gabriel on 1/1/24.
//

import SwiftUI

struct Examples: View {
    @State var stylingColor = Color.green
    @State var stylingBlendMode: BlendMode = .multiply
    @State var presentBlendModeOptions = false
    
    var body: some View {
        List {
            Section("Masking") {
                cutOutView
            }
            
            Section("Styling") {
                stylingView
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .navigationTitle("Examples")
        .sheet(isPresented: $presentBlendModeOptions) {
            BlendModeList(selectedBlendMode: $stylingBlendMode)
        }
    }
    
    var cutOutView: some View {
        HStack {
            ZStack {
                Image("restArea")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 5)))
                
                Star(corners: 5, smoothness: 0.5)
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
            .frame(width: 150, height: 150)
            
            Spacer()
            
            ZStack {
                Image("restArea")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 5)))
                
                Text("AB\nCD")
                    .font(.system(size: 62))
                    .bold()
                    .italic()
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
            .frame(width: 150, height: 150)
        }
        .background(
            Image("twilightHouse")
                .resizable()
        )
        .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 5)))
    }
    
    var stylingView: some View {
        VStack(spacing: 16) {
            ColorPicker("Selected Color", selection: $stylingColor)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Image("restArea")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 5)))
                        .frame(width: 150, height: 150)
                        .overlay {
                            RoundedRectangle(cornerSize: .init(width: 10, height: 5))
                                .fill(stylingColor)
                                .blendMode(stylingBlendMode)
                        }
                    
                    Text("BlendMode: \(stylingBlendMode.description)")
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    presentBlendModeOptions = true
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Image("restArea")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 5)))
                        .frame(width: 150, height: 150)
                        .colorMultiply(stylingColor)
                    
                    Text("Color Multiply")
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        Examples()
    }
}
