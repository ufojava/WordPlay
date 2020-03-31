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
    
    
    
    var body: some View {
        
        
        
        NavigationView {
        
                        ZStack {
                            
                            Image("4LettersFrontScreen")
                                .resizable()
                            
                                .scaledToFill()
                            
                                .edgesIgnoringSafeArea(.all)
                            
                                .onAppear() {
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    
                                        withAnimation {
                                            self.showGameGameButton = true
                                        }
                                    }
                                    
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    
                                        withAnimation {
                                            
                                            self.showTutorialButton = true
                                        }
                                    
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    
                                        withAnimation {
                                            
                                            self.showDictionaryButton = true
                                        }
                                        
                                    }
                                    
                            }
                                
                                
                        
                        VStack {
                        
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
                            
                            if showDictionaryButton {
                            
                                Text("Dictionary").font(.custom("Noteworthy", size: 25))
                                    .frame(width:150,height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                    .transition(.move(edge: .leading))
                            
                            }
                        }
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
