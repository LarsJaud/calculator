//
//  WelcomeView.swift
//  calculator
//
//  Created by Lars Jaud on 12.01.25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var username: String
    @Binding var isWelcomeScreenActive: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .multilineTextAlignment(.center)
            
            Button(action: {
                isWelcomeScreenActive = false
            }) {
                Text("Start")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

