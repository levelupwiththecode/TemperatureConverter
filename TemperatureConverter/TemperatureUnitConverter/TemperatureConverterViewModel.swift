//
//  TemperatureConverterViewModel.swift
//  UnitConversionApp
//
//  Created by Massidé Dosso on 13/01/2025.
//

import Foundation

class TemperatureConverterViewModel: ObservableObject {
    private let temperatureConverter = TemperatureConverter()
    // Format the float number of temperature value after conversion
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    /*
    private let formattera = NumberFormatter()
    formattera.numberStyle = .ordinal
    formattera.maximumFractionDigits = 2
    formattera.minimumFractionDigits = 0
    */
    
    @Published var temperatureToConvert = 0.0
    @Published var selectedUnit = ""
    @Published var convertedResults: [String] = []
    @Published var temperatureUnits = ["Celcius", "Fahrenheit", "Kelvin"]


    
    // CONVERT ACCORDING TO THE SELECTED UNIT
    func convertTemperature() {
        // Reset results before each conversion
        convertedResults = []
        
        if selectedUnit == "Celcius" {
            let fahrenheit = temperatureConverter.celciusToFahrenheit(celcius: temperatureToConvert)
            let kelvin = temperatureConverter.celciusToKelvin(celcius: temperatureToConvert)
            
            convertedResults.append("\(formatter.string(for: fahrenheit) ?? "N/A") °F")
            convertedResults.append("\(formatter.string(for: kelvin) ?? "N/A") K")
        } else if selectedUnit == "Fahrenheit" {
            let celcius = temperatureConverter.fahrenheitToCelcius(fahrenheit: temperatureToConvert)
            let kelvin = temperatureConverter.fahrenheitToKelvin(fahrenheit: temperatureToConvert)
            
            convertedResults.append("\(formatter.string(for: celcius) ?? "N/A") °C")
            convertedResults.append("\(formatter.string(for: kelvin) ?? "N/A") K")
        } else if selectedUnit == "Kelvin" {
            let celcius = temperatureConverter.kelvinToCelcius(kelvin: temperatureToConvert)
            let fahrenheit = temperatureConverter.kelvinToFahrenheit(kelvin: temperatureToConvert)
            
            convertedResults.append("\(formatter.string(for: celcius) ?? "N/A") °C")
            convertedResults.append("\(formatter.string(for: fahrenheit) ?? "N/A") °F")
        }
        
    }
    
    // Switch temperature to opposite sign of current value + -> -
    func reverseTemperature() {
        temperatureToConvert = -temperatureToConvert
    }

}


