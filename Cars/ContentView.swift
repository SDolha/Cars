//
//  ContentView.swift
//  Cars
//
//  Created by Sorin Dolha on 30.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0, green: 0.25, blue: 0))
                    .frame(height: 10)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 5)
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 250)
                    HStack {
                        Spacer()
                        ForEach(1...6, id: \.self) { _ in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 100, height: 5)
                            Spacer()
                        }
                    }
                    HStack(spacing: 0) {
                        Spacer()
                        ForEach(1...2, id: \.self) { coloana in
                            VStack(spacing: 0) {
                                ForEach(1...25, id: \.self) { rand in
                                    Rectangle()
                                        .fill(rand % 2 == coloana % 2 ? Color.gray : Color.clear)
                                        .frame(width: 10, height: 10)
                                }
                            }
                        }
                    }
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            Image("Car-computer")
                                .resizable().scaledToFit()
                                .frame(width: 150, height: 100)
                                .position(x: 75 + computersCarPosition * geometry.size.width / 100, y: 50)
                            Spacer()
                            ZStack {
                                Image("Car-you")
                                    .resizable().scaledToFit()
                                    .frame(width: 150, height: 100)
                                    .position(x: 75 + yourCarPosition * geometry.size.width / 100, y: 50)
                                if (yourCarPosition == 0) {
                                    HStack {
                                        Text("You")
                                            .font(.title)
                                            .foregroundColor(.blue)
                                            .padding(.top, 65)
                                            .padding(.horizontal, 50)
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                        }
                    }.frame(height: 250)
                }
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 5)
                Rectangle()
                    .fill(Color(red: 0, green: 0.25, blue: 0))
                    .frame(height: 10)
            }
            Spacer()
            HStack {
                Text(banner)
                    .font(.title)
                    .foregroundColor(bannerColor)
                    .padding()
                Spacer()
                if (!canAccelerate) {
                    Button(action: restart) {
                        Text("Restart")
                            .frame(width: 200, height: 100)
                            .background(Color.purple).foregroundColor(Color.white)
                            .padding()
                    }
                }
                Button(action: accelerate) {
                    Text("Accelerate")
                        .frame(width: 200, height: 100)
                        .background(Color.orange).foregroundColor(Color.white)
                        .padding()
                }
                .disabled(!canAccelerate)
            }
        }
    }
    @State var canAccelerate = true
    @State var computersCarPosition = CGFloat(0)
    @State var yourCarPosition = CGFloat(0)
    static let maxCarPosition = CGFloat(85)
    @State var banner = "Start!"
    @State var bannerColor = Color.green
    func accelerate() {
        withAnimation {
            banner = "Go!"
            bannerColor = .gray
            yourCarPosition += 5
            computersCarPosition += .random(in: 0..<10)
            if yourCarPosition > Self.maxCarPosition || computersCarPosition > Self.maxCarPosition {
                if yourCarPosition > computersCarPosition + 1 {
                    banner = "You win!"
                    bannerColor = .blue
                } else if computersCarPosition > yourCarPosition + 1 {
                    banner = "You lose!"
                    bannerColor = .red
                } else {
                    banner = "Draw!"
                    bannerColor = .yellow
                }
                canAccelerate = false
            }
        }
    }
    func restart() {
        withAnimation {
            banner = "Start!"
            bannerColor = .green
            yourCarPosition = 0
            computersCarPosition = 0
            canAccelerate = true
        }
    }
}
