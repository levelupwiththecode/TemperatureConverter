//
//  TemperatureConverterApp.swift
//  TemperatureConverter
//
//  Created by Massidé Dosso on 25/09/2024.
//

import SwiftUI
import GoogleMobileAds

@main
struct TemperatureConverterApp: App {
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            TemperatureConverterView()
        }
    }
}
