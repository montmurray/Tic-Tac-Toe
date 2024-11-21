//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Tessa Murray on 11/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
    @State private var gameOver = false
    @State private var winMessage = ""
    var body: some View {
        VStack {
            Text("Tic Tac Toe").bold()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                ForEach(0..<9) { index in
                    ZStack{
                        Color.blue
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        Text(moves[index])
                            .font(.system(size:90))
                            .fontWeight(.heavy)
                    }
                    .frame(width:120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation {
                            moves[index] = xTurn ? "X" : "O"
                            xTurn.toggle()
                        }
                    }
                    .rotation3DEffect(.degrees(moves[index] == "" ? 180 : 0), axis: (0, 1, 0))
                }
            }
            .preferredColorScheme(.dark)
            .alert(isPresented: $gameOver) {
                Alert(title: Text(winMessage), dismissButton: .destructive(Text("Play again"), action: {
                    withAnimation {
                        moves = Array(repeating: "", count: 9)
                        gameOver = false
                    }
                }))
            }
            .onChange(of: moves) { oldValue, newValue in
                checkForWinner()
            }
        }
    }
    private func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2) //top row
    }
    private func checkLine(a: Int, b: Int, c: Int) {
        if moves[a] != "" && moves[b] == moves[b] && moves[b] == moves[c] {
            winMessage = "\(moves[a]) is the winner!"
            gameOver = true
        }
    }
}
#Preview {
    ContentView()
}
