//
//  ContentView.swift
//  TemperatureConversionApp
//
//  Created by Massidé Dosso on 25/09/2024.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State private var conversionUnitInput = "Celcius"
    @State private var conversionUnitOutput = ""
    @State private var temperatureToConvert = 0.0
    @State private var selectedUnit = "Fahrenheit"
    @FocusState private var temperatureIsFocused: Bool
    
    let temperatureUnits = ["Celcius", "Fahrenheit", "Kelvin"]
    
    func celciusToFahrenheit(celcius: Double) -> Double {
        let tempInFahrenheit = (celcius * (9/5)) + 32
        return tempInFahrenheit
    }
    
    func celciusToKelvin(celcius: Double) -> Double {
        let tempInKelvin = celcius + 273.15
        return tempInKelvin
    }
    
    func fahrenheitToCelcius(fahrenheit: Double) -> Double {
        let tempInCelcius = (fahrenheit - 32) * 5/9
        return tempInCelcius
    }
    
    func fahrenheitToKelvin(fahrenheit: Double) -> Double {
        let tempInKelvin = (fahrenheit - 32) * 5/9 + 273.15
        return tempInKelvin
    }
    
    
     func kelvinToCelcius(kelvin: Double) -> Double {
         let tempInCelcius = kelvin - 273.15
         return tempInCelcius
     }
     
     func kelvinToFahrenheit(kelvin: Double) -> Double {
         let tempFahrenheit = (kelvin - 273.15) * 9/5 + 32
         return tempFahrenheit
     }
     
                    

    var body: some View {
        NavigationStack {
            VStack {
                
                Form {
                    Section("Temperature to convert") {
                        TextField("temperature to convert", value: $temperatureToConvert, format: .number)
                            .keyboardType(.numberPad)
                            .focused($temperatureIsFocused)
                        Picker("unit to convert", selection: $conversionUnitInput) {
                            ForEach(temperatureUnits, id: \.self) { unit in
                                Text("\(unit)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    if selectedUnit == "Celcius" {
                        Section("Celcius") {
                            Text("\(celciusToFahrenheit(celcius: temperatureToConvert), format: .number) Fahrenheit ")
                            Text("\(celciusToKelvin(celcius: temperatureToConvert), format: .number) Kelvin")
                            }
                    } else if selectedUnit == "Fahrenheit" {
                            Section("Fahrenheit") {
                                    Text("\(fahrenheitToCelcius(fahrenheit: temperatureToConvert), format: .number) celcius ")
                                Text("\(fahrenheitToKelvin(fahrenheit: temperatureToConvert), format: .number) Kelvin")
                            }
                        } else {
                            Section("Kelvin") {
                                    Text("\(kelvinToCelcius(kelvin: temperatureToConvert), format: .number) celcius ")
                                Text("\(kelvinToFahrenheit(kelvin: temperatureToConvert), format: .number) Fahrenheit")
         
                            }
                    }
                    
                }
            }
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
