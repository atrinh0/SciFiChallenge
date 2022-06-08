//
//  WeatherData.swift
//  scifi
//
//  Created by An Trinh on 08/06/2022.
//

import Foundation
import WeatherKit
import CoreLocation

@MainActor
class WeatherData: ObservableObject {
    @Published var dailyForecasts: [DailyForecast] = []

    func fetchDailyForecast() async {
        let weatherService = WeatherService()
        let brighton = CLLocation(latitude: 50.8229, longitude: 0.1363)

        guard let weather = try? await weatherService.weather(for: brighton) else {
            return
        }

        dailyForecasts = weather.dailyForecast.forecast.map {
            DailyForecast(date: $0.date, min: $0.lowTemperature.value, max: $0.highTemperature.value)
        }
    }
}

struct DailyForecast: Identifiable {
    let id = UUID()
    let date: Date
    let min: Double
    let max: Double
}
