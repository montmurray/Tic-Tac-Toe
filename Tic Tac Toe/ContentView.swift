//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Tessa Murray on 11/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .bold()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                ForEach(0..<9) { index in
                    ZStack{
                        Color.blue
                        Text("X")
                            .font(.system(size:90))
                            .fontWeight(.heavy)
                    }
                    .frame(width:120, height: 120, alignment: .center)
                    .cornerRadius(30)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
