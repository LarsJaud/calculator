//
//  ContentView.swift
//  calculator
//
//  Created by Lars Jaud on 12.01.25.
//

import SwiftUI

struct ContentView: View {
    @State var display = "0"
    @State private var firstNumber: Double?
    @State private var operation: String?
    @State private var isEnteringSecondNumber = false
    @State private var isDarkMode = false // Zustand für Dark Mode
    
    var body: some View {
        VStack(spacing: 10) {
            // Toggle für Dark Mode
            HStack {
                Text("Dark Mode")
                    .font(.headline)
                Spacer()
                Toggle("", isOn: $isDarkMode)
                    .labelsHidden()
            }
            .padding(50)
            
            // Display-Anzeige
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Buttons
            let buttons = [
                ["7", "8", "9", "÷"],
                ["4", "5", "6", "×"],
                ["1", "2", "3", "-"],
                ["C", "0", ".", "+"],
                ["="]
            ]
            
            // Button-Layout
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(isDarkMode ? Color.gray : Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .preferredColorScheme(isDarkMode ? .dark : .light) // Dynamische Umschaltung
    }
    
    // Button-Logik
    func buttonTapped(_ button: String) {
        if let number = Int(button) {
            // Zahleneingabe
            if display == "0" || isEnteringSecondNumber {
                display = "\(number)"
                isEnteringSecondNumber = false
            } else {
                display += "\(number)"
            }
        } else if button == "." {
            // Dezimalpunkt hinzufügen
            if !display.contains(".") {
                display += "."
            }
        } else if button == "C" {
            // Reset
            display = "0"
            firstNumber = nil
            operation = nil
            isEnteringSecondNumber = false
        } else if button == "=" {
            // Berechnung
            if let first = firstNumber, let op = operation, let second = Double(display) {
                let result: Double
                switch op {
                case "+":
                    result = first + second
                case "-":
                    result = first - second
                case "×":
                    result = first * second
                case "÷":
                    result = second != 0 ? first / second : Double.nan
                default:
                    return
                }
                display = formatResult(result)
                firstNumber = nil
                operation = nil
                isEnteringSecondNumber = false
            }
        } else {
            // Operation
            if let currentNumber = Double(display) {
                firstNumber = currentNumber
                operation = button
                isEnteringSecondNumber = true
            }
        }
    }
    
    // Formatierung der Ergebnisse
    func formatResult(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result) // Ganze Zahl ohne Nachkommastellen
        } else {
            return String(result) // Kommazahl
        }
    }
}

#Preview {
    ContentView()
}
