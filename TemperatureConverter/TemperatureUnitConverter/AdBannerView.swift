//
//  AdBannerView.swift
//  UnitConversionApp
//
//  Created by Massidé Dosso on 21/01/2025.
//

import SwiftUI
import GoogleMobileAds

struct AdBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(200))
        bannerView.adUnitID = "ca-app-pub-9883349206004208/7778572229" 
        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
        bannerView.load(GADRequest())
        return bannerView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {}
    
    
    
  
}

