//
//  ContentView.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 28/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showGameGameButton = false
    @State private var showTutorialButton = false
    @State private var showDictionaryButton = false
    
    //Button Placeholders State
    @State private var loadingGameButton = true
    @State private var loadingTutorialButton = true
    @State private var loadingDictionaryButton = true
    
    //Assigning State value
    @State private var loadingGame = "Loading..."
    @State private var loadingTutorial = "Loading..."
    @State private var loadingDictionary = "Loading..."
    
    //Intro Music Control
    @State private var playIntroMusic = false
    
    
    
    var body: some View {
        
        
        
        NavigationView {
        
                        ZStack {
                            
                            Image("4LettersFrontScreen")
                                .resizable()
                            
                                .scaledToFill()
                            
                                .edgesIgnoringSafeArea(.all)
                            
                                .onAppear() {
                                    
                                    if self.playIntroMusic == false {
                                        
                                        self.playIntroMusic.toggle()
                                        
                                        if self.playIntroMusic {
                                            
                                            playAudioFile(sound: "4LetterIntro", type: "mp3")
                                        }
                                    }
                                    
                                    
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                                    
                                        withAnimation {
                                            self.showGameGameButton = true
                                            self.loadingGameButton = false
                                        }
                                    }
                                    
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                                    
                                        withAnimation {
                                            
                                            self.showTutorialButton = true
                                            self.loadingTutorialButton = false
                                        }
                                    
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                                    
                                        withAnimation {
                                            
                                            self.showDictionaryButton = true
                                            self.loadingDictionaryButton = false
                                        }
                                        
                                    }
                                  
                                    
                            }
                            
                          
                                
                                
                        
                        VStack {
                            
                            if loadingGameButton {
                                Text("\(self.loadingGame)")
                                    .foregroundColor(Color.white)
                                    .transition(.move(edge: .trailing))
                            }
                        
                            if showGameGameButton {
                            
                            NavigationLink(destination: GamePlay()) {
                                
                                
                                Text("Play Game").font(.custom("Noteworthy", size: 25))
                                    .frame(width:150,height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                    
                                
                            }.transition(.move(edge: .leading))
                                
                            }//End Game Button
                            
                            Spacer().frame(height:10)
                            
                            if loadingTutorialButton {
                                Text("\(self.loadingTutorial)")
                                    .foregroundColor(Color.white)
                                    .transition(.move(edge: .trailing))
                            }
                            
                            if showTutorialButton {
                                
                                NavigationLink(destination: GameHelp()) {
                                    
                                    Text("Tutorial").font(.custom("Noteworthy", size: 25))
                                    .frame(width:150,height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                    
                                    
                                    
                                    
                                }.transition(.move(edge: .leading))
                            
                            
                            
                                
                                
                            }//End turorial button
                            
                            
                            Spacer().frame(height:10)
                            
                            if loadingDictionaryButton {
                                Text("\(self.loadingDictionary)")
                                    .foregroundColor(Color.white)
                                    .transition(.move(edge: .trailing))
                            }
                            
                            if showDictionaryButton {
                                
                                NavigationLink(destination: GameDictionary()) {
                            
                                Text("Dictionary").font(.custom("Noteworthy", size: 25))
                                    .frame(width:150,height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                    
                                }.transition(.move(edge: .leading))
                            }//End of Dictionary
                            
                            Spacer().frame(height:30)
                            
                            //Decoration colour bar
                            HStack {
                                Rectangle()
                                    .foregroundColor(Color.red)
                                    .frame(width:50,height: 10)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                
                                Rectangle()
                                    .frame(width:50,height: 10)
                                    .foregroundColor(Color.blue)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                
                                Rectangle()
                                    .frame(width:50,height: 10)
                                    .foregroundColor(Color.green)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                
                                Rectangle()
                                    .frame(width:50,height: 10)
                                    .foregroundColor(Color.yellow)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                
                                Rectangle()
                                    .frame(width:50,height: 10)
                                    .foregroundColor(Color.purple)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                            }
                            
                        }//End of VStack
            }
        
        .navigationBarTitle(Text("Home 🏚"))
        
        }
        
}

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
