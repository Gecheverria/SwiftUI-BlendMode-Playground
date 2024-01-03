//
//  BlendModeView.swift
//  BlendMode
//
//  Created by RAVN on 12/27/23.
//

import SwiftUI

struct BlendModeView: View {
    // MARK: - Properties
    @State private var firstCircleColor = Color.red
    @State private var secondCircleColor = Color.green
    @State private var thirdCircleColor = Color.blue
    
    @State private var presentSecondCircleConfig = false
    @State private var presentThirdCircleConfig = false
    
    @State var secondCircleBlendMode: BlendMode = .normal
    @State var thirdCircleBlendMode: BlendMode = .normal
    
    // MARK: - Main View
    var body: some View {
        VStack(spacing: 16) {
            Text("Select colors")
                .padding(.top)
                .bold()
            
            ColorPicker("First Circle Color", selection: $firstCircleColor)
            ColorPicker("Second Circle Color", selection: $secondCircleColor)
            ColorPicker("Third Circle Color", selection: $thirdCircleColor)
            
            circleViews
            
            VStack(alignment: .leading) {
                Text("Second Circle Blend Mode: \(secondCircleBlendMode.name)")
                Text("Third Circle Blend Mode: \(thirdCircleBlendMode.name)")
            }
            
            Spacer()
        }
        .navigationTitle("Playground")
        .padding(.horizontal)
        .sheet(isPresented: $presentSecondCircleConfig) {
            BlendModeList(selectedBlendMode: $secondCircleBlendMode)
        }
        .sheet(isPresented: $presentThirdCircleConfig) {
            BlendModeList(selectedBlendMode: $thirdCircleBlendMode)
        }
    }
    
    // MARK: - Sub Views
    var circleViews: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Circle()
                    .foregroundStyle(firstCircleColor)
                    .frame(width: geometry.size.width / 2)
                    .padding(.leading, geometry.size.width / 8)
                
                Circle()
                    .foregroundStyle(secondCircleColor)
                    .frame(width: geometry.size.width / 2)
                    .padding(.leading, geometry.size.width / 2.5)
                    .blendMode(secondCircleBlendMode)
                    .onTapGesture {
                        presentSecondCircleConfig = true
                    }
                
                Circle()
                    .foregroundStyle(thirdCircleColor)
                    .frame(width: geometry.size.width / 2)
                    .padding(.leading, geometry.size.width / 3.75)
                    .padding(.top, geometry.size.width / 2)
                    .blendMode(thirdCircleBlendMode)
                    .onTapGesture {
                        presentThirdCircleConfig = true
                    }
            }
        }
    }
}

#Preview {
    NavigationView {
        BlendModeView()
    }
}
