//
//  Gradient.swift
//  BlendMode
//
//  Created by RAVN on 1/2/24.
//

import SwiftUI

struct GradientView: View {
    // MARK: - Properties
    @State private var firstColor = Color.red
    @State private var secondColor = Color.blue
    @State private var gradientBlendMode: BlendMode = .normal
    
    @State private var blendGradients = false
    @State private var blendRainbow = false
    
    @State private var rainbowGradientBlendMode: BlendMode = .normal
    
    @State private var presentColorBlendModeList = false
    @State private var presentRainbowBlendMode = false
    
    // MARK: - Main View
    var body: some View {
        List {
            Section("Defined Color Gradient") {
                definedGradient
            }
            
            Section("Rainbow color gradient") {
                rainbowGradientView
            }
        }
        .navigationTitle("Color Gradients")
        .sheet(isPresented: $presentColorBlendModeList) {
            BlendModeList(selectedBlendMode: $gradientBlendMode)
        }
        .sheet(isPresented: $presentRainbowBlendMode) {
            BlendModeList(selectedBlendMode: $rainbowGradientBlendMode)
        }
    }
    
    // MARK: - Subviews
    private var definedGradient: some View {
        VStack(alignment: .leading) {
            ColorPicker("First Circle Color", selection: $firstColor)
            ColorPicker("First Circle Color", selection: $secondColor)
                .padding(.bottom)
            
            Toggle("Enable blending: \(gradientBlendMode.name)", isOn: $blendGradients)
            
            Text(gradientBlendMode.description)
                .font(.callout)
                .foregroundStyle(Color.gray)
            
            VStack {
                ZStack {
                    Image("restArea")
                        .resizable()
                    
                    if blendGradients {
                        LinearGradient(gradient: Gradient(colors: [firstColor, secondColor]), startPoint: .leading, endPoint: .trailing)
                            .blendMode(gradientBlendMode)
                    }
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ZStack {
                    Image("twilightHouse")
                        .resizable()
                    
                    if blendGradients {
                        LinearGradient(gradient: Gradient(colors: [firstColor, secondColor]), startPoint: .trailing, endPoint: .leading)
                            .blendMode(gradientBlendMode)
                    }
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                presentColorBlendModeList = true
            }
        }
    }
    
    private var rainbowGradientView: some View {
        VStack(alignment: .leading) {
            Toggle("Enable blending: \(rainbowGradientBlendMode.name)", isOn: $blendRainbow)
            
            Text(rainbowGradientBlendMode.description)
                .font(.callout)
                .foregroundStyle(Color.gray)
            
            VStack {
                ZStack {
                    Image("restArea")
                        .resizable()
                    
                    if blendRainbow {
                        LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .bottom, endPoint: .top)
                            .blendMode(rainbowGradientBlendMode)
                    }
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ZStack {
                    Image("twilightHouse")
                        .resizable()
                    
                    if blendRainbow {
                        LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .blendMode(rainbowGradientBlendMode)
                    }
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                presentRainbowBlendMode = true
            }
        }
    }
}

#Preview {
    GradientView()
}
