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
    @State var display: String = "0"
    @State var decimalPointUsed: Bool = false
    @State var int1: Int = 0
    @State var int2: Int = 0
    @State var double1: Double = 0
    @State var double2: Double = 0
    @State var operationJustPressed: Bool = false
    @State var plusOperation: Bool = false
    @State var minusOperation: Bool = false
    @State var multiplyOperation: Bool = false
    @State var divideOperation: Bool = false
    @State var usingDouble: Bool = false
    @State var answerInt: Int = 0
    @State var answerDouble: Double = 0
    var body: some View {
        VStack{
            Spacer()
            Text(display)
            Spacer()
            LazyVGrid (columns: columns1) {
                Group{
                    ButtonView(words: "AC")
                    ButtonView(words: "+/-")
                    Button(action:{
                        divideOperation = true
                        operationJustPressed = true
                        convertStringToNumber(input: display)
                    }, label:{
                        if divideOperation == true {
                            SelectedButtonView(words: "/")
                        }
                        else {
                            ButtonView(words: "/")
                        }
                    })
                    Button(action:{
                        multiplyOperation = true
                        operationJustPressed = true
                        convertStringToNumber(input: display)
                    }, label:{
                        if multiplyOperation == true {
                            SelectedButtonView(words: "X")
                        }
                        else {
                            ButtonView(words: "X")
                        }
                    })
                    Button(action:{
                        addNumberToString(input: "7")
                    }, label:{
                        ButtonView(words: "7")
                    })
                    Button(action:{
                        addNumberToString(input: "8")
                    }, label:{
                        ButtonView(words: "8")
                    })
                    Button(action:{
                        addNumberToString(input: "9")
                    }, label:{
                        ButtonView(words: "9")
                    })
                    Button(action:{
                        minusOperation = true
                        operationJustPressed = true
                        convertStringToNumber(input: display)
                    }, label:{
                        if minusOperation == true {
                            SelectedButtonView(words: "-")
                        }
                        else {
                            ButtonView(words: "-")
                        }
                    })
                    Button(action:{
                        addNumberToString(input: "4")
                    }, label:{
                        ButtonView(words: "4")
                    })
                    Button(action:{
                        addNumberToString(input: "5")
                    }, label:{
                        ButtonView(words: "5")
                    })
                }
                Group{
                    Button(action:{
                        addNumberToString(input: "6")
                    }, label:{
                        ButtonView(words: "6")
                    })
                    Button(action:{
                        plusOperation = true
                        operationJustPressed = true
                        convertStringToNumber(input: display)
                    }, label:{
                        if plusOperation == true {
                            SelectedButtonView(words: "+")
                        }
                        else {
                            ButtonView(words: "+")
                        }
                    })
                    Button(action:{
                        addNumberToString(input: "1")
                    }, label:{
                        ButtonView(words: "1")
                    })
                    Button(action:{
                        addNumberToString(input: "2")
                    }, label:{
                        ButtonView(words: "2")
                    })
                    Button(action:{
                        addNumberToString(input: "3")
                    }, label: {
                        ButtonView(words: "3")
                    })
                    Button(action:{
                        addDecimalToString(input: ".")
                    }, label:{
                        ButtonView(words: ".")
                    })
                }
            }
            LazyVGrid (columns: columns2) {
                Button(action:{
                    if display != "0" {
                        addNumberToString(input: "0")
                    }
                }, label:{
                    ButtonView(words: "0")
                })
                Button(action:{
                    convertStringToNumber2(input: display)
                    if plusOperation == true {
                        doAddition()
                    }
                    if minusOperation == true {
                        doSubtraction()
                    }
                    if multiplyOperation == true {
                        doMultiply()
                    }
                    if divideOperation == true {
                        doDivide()
                    }
                }, label:{
                    ButtonView(words: "=")
                })
            }
        }
    }
    func addNumberToString(input: String) {
        if display.count < 11 {
            if display == "0" || operationJustPressed == true {
                display = input
                operationJustPressed = false
            }
            else {
                display += input
            }
        }
    }
    func addDecimalToString(input: String) {
        if decimalPointUsed == false {
            display += input
            decimalPointUsed = true
        }
    }
    func convertStringToNumber(input: String) {
        if decimalPointUsed == false {
            int1 = Int(input) ?? 0
        }
        else {
            double1 = Double(input) ?? 0
            usingDouble = true
        }
    }
    func convertStringToNumber2(input: String) {
        if decimalPointUsed == false {
            int2 = Int(input) ?? 0
        }
        else {
            double2 = Double(input) ?? 0
            usingDouble = true
        }
    }
    func doAddition() {
        if usingDouble == true {
            answerDouble = double1 + double2
            display = String(answerDouble)
        }
        else {
            answerInt = int1 + int2
            display = String(answerInt)
        }
    }
    func doSubtraction() {
        if usingDouble == true {
            answerDouble = double1 - double2
            display = String(answerDouble)
        }
        else {
            answerInt = int1 - int2
            display = String(answerInt)
        }
    }
    func doMultiply() {
        if usingDouble == true {
            answerDouble = double1 * double2
            display = String(answerDouble)
        }
        else {
            answerInt = int1 * int2
            display = String(answerInt)
        }
    }
    func doDivide() {
        if usingDouble == true {
            answerDouble = double1 / double2
            display = String(answerDouble)
        }
        else {
            answerInt = int1 / int2
            display = String(answerInt)
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

struct SelectedButtonView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var words: String
    var body: some View {
        if colorScheme == .dark {
            Text(words).foregroundColor(.white)
                .background(Color.yellow)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .border(.white)
        }
        else {
            Text(words).foregroundColor(.black)
                .background(Color.red)
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
