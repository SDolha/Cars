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
                    VStack{
                        Spacer()
                        Image("Car-computer")
                            .resizable().scaledToFit()
                            .frame(width: 150, height: 100)
                        Spacer()
                        Image("Car-you")
                            .resizable().scaledToFit()
                            .frame(width: 150, height: 100)
                        Spacer()
                    }.frame(height: 250)
                }
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 5)
            }
            Spacer()
            HStack {
                Spacer()
                Button("Accelerate", action: accelerate)
                    .frame(width: 200, height: 100)
                    .background(Color.orange).foregroundColor(Color.white)
                    .padding()
            }
        }
    }
    func accelerate() {
        //...
    }
}
