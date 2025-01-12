//
//  ContentView.swift
//  calculator
//
//  Created by Lars Jaud on 12.01.25.
//

import SwiftUI

struct ContentView: View {
    @State var display = "0"
    
    var body: some View {
        VStack(spacing: 10) {
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
