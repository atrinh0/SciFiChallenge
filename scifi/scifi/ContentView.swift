//
//  ContentView.swift
//  scifi
//
//  Created by An Trinh on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var weatherData = WeatherData()

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                VStack(spacing: 10) {
                    topContent
                        .frame(height: geo.size.height / 3)
                    bottomContent
                        .frame(height: geo.size.height * (2/3) - 10)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .task {
            await weatherData.fetchDailyForecast()
        }
    }

    private var topContent: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 5) {
                    Color.lcarPink
                    Color.lcarViolet
                }
                .cornerRadius(70, corners: .bottomLeft)
                .overlay(alignment: .topTrailing) {
                    Color.black
                        .cornerRadius(35, corners: .bottomLeft)
                        .frame(width: geo.size.width - 100, height: geo.size.height - 20)
                }
                .overlay(alignment: .topLeading) {
                    Color.black
                        .frame(width: 100, height: 50)
                }
                .overlay(alignment: .bottomTrailing) {
                    ZStack {
                        Color.black
                        HStack(spacing: 5) {
                            Color.lcarOrange
                                .frame(width: 20)
                                .padding(.leading, 5)
                            Color.lcarPink
                                .frame(width: 50)
                            Color.lcarPink
                            Color.lcarPlum
                                .frame(width: 20)
                        }
                    }
                    .frame(width: 200, height: 20)
                }
                .overlay(alignment: .leading) {
                    VStack(alignment: .trailing, spacing: 15) {
                        Text("LCARS \(randomDigits(5))")
                        Text("02-\(randomDigits(6))")
                    }
                    .font(.custom("HelveticaNeue-CondensedBold", size: 17))
                    .foregroundColor(.black)
                    .scaleEffect(x: 0.7, anchor: .trailing)
                    .frame(width: 90)
                }
                .overlay(alignment: .topTrailing) {
                    Text("LCARS ACCESS 411")
                        .font(.custom("HelveticaNeue-CondensedBold", size: 35))
                        .padding(.top, 45)
                        .foregroundColor(.lcarOrange)
                        .scaleEffect(x: 0.7, anchor: .trailing)
                }
                .overlay(alignment: .trailing) {
                    Grid(alignment: .trailing) {
                        ForEach(0..<7) { row in
                            GridRow {
                                ForEach(0..<5) { _ in
                                    Text(randomDigits(Int.random(in: 1...6)))
                                        .foregroundColor((row == 3 || row == 4) ? .lcarWhite : .lcarOrange)
                                }
                            }
                        }
                    }
                    .font(.custom("HelveticaNeue-CondensedBold", size: 17))
                    .padding(.top, 40)
                }
            }
        }
    }

    private var bottomContent: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 5) {
                    Color.lcarPlum
                        .frame(height: 100)
                    Color.lcarPlum
                        .frame(height: 200)
                    Color.lcarOrange
                        .frame(height: 50)
                    Color.lcarTan
                }
                .cornerRadius(70, corners: .topLeft)
                .overlay(alignment: .bottomTrailing) {
                    Color.black
                        .cornerRadius(35, corners: .topLeft)
                        .frame(width: geo.size.width - 100, height: geo.size.height - 20)
                }
                .overlay(alignment: .bottomLeading) {
                    Color.black
                        .frame(width: 100, height: 50)
                }
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Color.black
                        HStack(alignment: .top, spacing: 5) {
                            Color.lcarLightOrange
                                .frame(width: 20)
                                .padding(.leading, 5)
                            Color.lcarLightOrange
                                .frame(width: 50, height: 10)
                            Color.lcarPink
                            Color.lcarOrange
                                .frame(width: 20)
                        }
                    }
                    .frame(width: 200, height: 20)
                }
                .overlay(alignment: .leading) {
                    VStack(alignment: .trailing, spacing: 15) {
                        Text("LCARS \(randomDigits(5))")
                        Text("02-\(randomDigits(6))")
                    }
                    .font(.custom("HelveticaNeue-CondensedBold", size: 17))
                    .foregroundColor(.black)
                    .scaleEffect(x: 0.7, anchor: .trailing)
                    .frame(width: 90)
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("DATA NODE 188")
                        .font(.custom("HelveticaNeue-CondensedBold", size: 35))
                        .padding(.bottom, 45)
                        .foregroundColor(.lcarOrange)
                        .scaleEffect(x: 0.7, anchor: .trailing)
                }
                .overlay {
                    Image("ufp-logo")
                        .opacity(0.1)
                        .offset(x: 50)
                }
            }
        }
    }

    private func randomDigits(_ count: Int) -> String {
        var randString = ""
        for _ in 0...(count - 1) {
            randString += "\(Int.random(in: 0...9))"
        }
        return randString
    }
}

extension Color {
    static let lcarLightOrange = Color("lcarLightOrange")
    static let lcarOrange = Color("lcarOrange")
    static let lcarPink = Color("lcarPink")
    static let lcarPlum = Color("lcarPlum")
    static let lcarTan = Color("lcarTan")
    static let lcarViolet = Color("lcarViolet")
    static let lcarWhite = Color("lcarWhite")
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
