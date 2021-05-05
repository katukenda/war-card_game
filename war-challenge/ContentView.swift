//
//  ContentView.swift
//  war-challenge
//
//  Created by Janitha Katukenda on 2021-04-24.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var cpuScore = 0
    @State private var playerScore = 0
    @State private var winingStatement = "Now Try"
    @State private var tern = "Player"
    @State private var count = 15
    @State private var gameMode = false
    
    var body: some View {
        
        ZStack{
            
            VStack{
                VStack{
                    Spacer()
                    
                    Image("logo")
                    
                    Spacer()
                    Text(winingStatement + " " + tern)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.pink)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(cpuCard)
                        Spacer()
                    }
                   
                    Spacer()
                    
                    Button(action: {
                        //generate randon number 2 and 14
                        
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        
                        // Updaye the cards
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                        
                        if (count >= 1 ) {
                            
                            if (count % 2 == 0){
                                count = count - 1
                                tern = "CPU"
                                if ( playerRand > cpuRand ) {
                                 playerScore += 1
                                }
                                else if (playerRand < cpuRand) {
                                    
                                    cpuScore += 1
                                }
                                
                                else{
                                    playerScore += 1
                                    cpuScore += 1
                                  
                                }
                            }
                            
                            else{
                                tern = "player"
                                count = count - 1
                                if ( playerRand > cpuRand ) {
                                 playerScore += 1
                                }
                                else if (playerRand < cpuRand) {
                                    
                                    cpuScore += 1
                                }
                                
                                else{
                                    playerScore += 1
                                    cpuScore += 1
                                  
                                }
                            }
                            
                           
                        }
                        else{
                            winingStatement = "The winner is "
                            gameMode = true
                            if( cpuScore > playerScore){
                                tern = "CPU"
                            }
                            
                            else if (cpuScore == playerScore) {
                                winingStatement = "No winner"
                                tern = ""
                            }
                            else{
                                tern = "Player"
                            }
                        }
                       
                        //update the score
                        //playerScore += 1
                        //cpuScore += 1
                    }, label: {
                        Image("dealbutton")
                    })
                    .disabled(gameMode)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10.0)
                            Text(String(playerScore))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(10.0)
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10.0)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(10.0)
                        }
                        
                        Spacer()
                        
                    }
                    
                   
                    
                    
                }
                
                Spacer()
                Text("JDevop")
                    .font(.footnote)
                    .foregroundColor(Color.red)
                    .bold()
                    
                Spacer()
                
            }
            
            
    
            
        }
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
