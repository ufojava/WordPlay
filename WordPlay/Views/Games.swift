//
//  Games.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 28/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//Word Games
import SwiftUI


struct GamePlay: View {
    
    var body: some View {
        
        
        NavigationView {
        
        
        //Text("Place HOlder")
        fourLetter()
        
            
        }
        
    }
    
    
}


//Game Play previews
struct GamePlay_Preview: PreviewProvider {
    
    static var previews: some View {
        
        
        GamePlay()
    }
    
    
}


//Four Letter Game
struct fourLetter: View {
    
    @ObservedObject var allWords = DataLoader()
    
    //Variables Input Text fields
    @State private var collectAllUserInputs = ""
    
    //Letter input
    @State private var userLetterOne = ""
    @State private var userLetterTwo = ""
    @State private var userLetterThree = ""
    @State private var userLetterFour = ""
    
    //State of collectAllUserInput - Must be four characters
    @State private var stateOfAllUserInputs = false
    
    
    //Alphabets
    @State private var alphabetOne = ["A","B","Z","X","Y"]
    @State private var alphabetTwo = ["C","D","P","O","K"]
    @State private var alphabetThree = ["T","W","N","F","I"]
    @State private var alphabetFour = ["L","S","U","H","E"]
    @State private var alphabetFive = ["G","Q","R","J","V"]
    @State private var alphabetSix = ["F"]
    
    
    
    
    
    //Function to check word
    func checkWord(inWord: String) -> String{
        
        var dictionaryCheck = ""
        
        let srchRecord = allWords.dataStructure.filter {$0.word == inWord}
        
        if srchRecord.indices.contains(0) {
            
            dictionaryCheck = "Records found"
            print(srchRecord[0])
        } else {
            
            dictionaryCheck = "No Record Found"
    
            
        }
            
        
    return dictionaryCheck
        
        
    }
    

  
    

    
    
    
    var body: some View {
        
        
    
        ZStack {
            
                    Image("4LettersOtherScreen")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            
                    
            
                            VStack {
                                
                                
                                ZStack {
                                    
                                        Rectangle()
                                            .frame(width:400,height:80)
                                            .foregroundColor(Color.init(red: 0.3, green: 0.4, blue: 0.4))
                                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black,lineWidth: 1))
                            
                            
                                    HStack {
                                        
                                        TextField("One", text: $userLetterOne).autocapitalization(.allCharacters).multilineTextAlignment(.center)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                           
                                        TextField("Two", text: $userLetterTwo).autocapitalization(.allCharacters).multilineTextAlignment(.center)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        
                                        TextField("Three", text: $userLetterThree).autocapitalization(.allCharacters).multilineTextAlignment(.center)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        TextField("Four", text: $userLetterFour).autocapitalization(.allCharacters).multilineTextAlignment(.center)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        
                                }.padding()
                                
                                }
                                HStack {
                                
                                    
                                    Button(action: {
                                        
                                        self.stateOfAllUserInputs.toggle()
                                        self.collectAllUserInputs = self.userLetterOne + self.userLetterTwo + self.userLetterThree + self.userLetterFour
                                        
                                        
                                    }) {
                                        
                                        Text("Play Word").foregroundColor(Color.white)
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    Text("\(self.collectAllUserInputs)")
                                  
                                    
                                }
                                
                                Spacer().frame(height:40)
                                
                                //Enter the
                                HStack {
                                    
                                    ForEach(0..<alphabetOne.count) {rowOne in
                                    
                                        //Text("\(self.alphabetOne[rowOne])")
                                        
                                        FormatTile(alphabet: self.alphabetOne[rowOne])
                                            .background(Color.orange)
                                    
                                            
                                    
                                }
                                
                                
                                }
                                
                                
                                if stateOfAllUserInputs {
                                    
                                    Text(checkWord(inWord: self.collectAllUserInputs))
                                    
                                }
                        
                            
                            Spacer()
                        
                            
                            


                        
                            
                        }
        }
        
    }
    
    
    
    
    
}

struct FormatTile: View {
    
    var alphabet = ""
   
    
    
    var body: some View {
        
        Text(alphabet)
            .frame(width:50,height:50)
            //.background(Color.orange)
            .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
        
        
    }
    
    
    
}
