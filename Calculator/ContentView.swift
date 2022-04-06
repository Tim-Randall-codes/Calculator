//
//  ContentView.swift
//  Calculator
//
//  Created by Tim Randall on 6/4/22.
//

import SwiftUI

struct ContentView: View {
    var columns1: [GridItem] = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10), GridItem(.flexible()), GridItem(.flexible())]
    var columns2: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack{
            Spacer()
            Text("hi")
            Spacer()
            LazyVGrid (columns: columns1) {
                Group{
                ButtonView(words: "AC")
                ButtonView(words: "+/-")
                ButtonView(words: "/")
                ButtonView(words: "X")
                ButtonView(words: "7")
                ButtonView(words: "8")
                ButtonView(words: "9")
                ButtonView(words: "-")
                ButtonView(words: "4")
                ButtonView(words: "5")
                }
                Group{
                    ButtonView(words: "6")
                    ButtonView(words: "+")
                    ButtonView(words: "1")
                    ButtonView(words: "2")
                    ButtonView(words: "3")
                    ButtonView(words: ".")
                }
            }
            LazyVGrid (columns: columns2) {
                ButtonView(words: "0")
                ButtonView(words: "=")
            }
        }
    }
}

struct ButtonView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var words: String
    var body: some View {
        if colorScheme == .dark {
            Text(words).foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .border(.white)
        }
        else {
            Text(words).foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .border(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
