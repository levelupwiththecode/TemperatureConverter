//
//  TemperatureConverterView.swift
//  UnitConversionApp
//
//  Created by Massidé Dosso on 25/09/2024.
//

import SwiftUI

struct TemperatureConverterView: View {
    @StateObject private var viewModel = TemperatureConverterViewModel()

    
    @FocusState private var temperatureIsFocused: Bool
    
    

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("temperature to convert") {
                        HStack {
                            Button {
                                // Do something
                                viewModel.reverseTemperature()
                                print("Button is tapped")
                            }
                        label: {
                            Image(systemName: "minus.forwardslash.plus")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.yellow.opacity(0.6))
                            }
                          
                            
                            TextField("", value: $viewModel.temperatureToConvert, format: .number)
                                .onChange(of: viewModel.temperatureToConvert) { _ in
                                                                viewModel.convertTemperature()
                                                            }
                                .frame(height: 100.0)
                                .keyboardType(.numberPad)
                                .focused($temperatureIsFocused)
                                .font(.largeTitle)
                              
                            
                        }
                        
                            
                        
                    }
                    
                    Picker("unit to convert", selection: $viewModel.selectedUnit) {
                        ForEach(viewModel.temperatureUnits, id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: viewModel.selectedUnit) { _ in
                        viewModel.convertTemperature()
                        }
                    
                                        
                    

                    
                    Section("") {
                        
                        ForEach(viewModel.convertedResults, id: \.self) { result in
                            Text(result)
                                .font(.system(size: 32))
                        }
                    }
                    
                    Section("ADS") {
                        AdBannerView()
                            .frame(height: 100)
                            
                    }
                
                }
            }.background(Color.yellow.opacity(0.2))
            .scrollContentBackground(.hidden)
            .navigationTitle("Temperature converter")
            .toolbar {
                if temperatureIsFocused {
                    Button("Done") {
                        temperatureIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    TemperatureConverterView()
}
// format https://stackoverflow.com/questions/59015484/swift-measurementformatter-from-celsius-not-working
