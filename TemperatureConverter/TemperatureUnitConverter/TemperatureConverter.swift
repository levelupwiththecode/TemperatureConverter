//
//  TemperatureConverter.swift
//  UnitConversionApp
//
//  Created by Massidé Dosso on 13/01/2025.
//

import Foundation

class TemperatureConverter {
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
}
