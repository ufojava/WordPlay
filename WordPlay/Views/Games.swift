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
                                
                                VStack {
                                
                                            //HStack for AlphabeOne
                                            HStack {
                                                
                                                ForEach(0..<alphabetOne.count) {rowOne in
                                                
                                                    
                                                    FormatTile(alphabet: self.alphabetOne[rowOne])
                                                        .background(Color.orange)
                                                
                                                        
                                                
                                            }
                                            
                                            
                                            }//End of HStack on Row one
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    
                                    //HStack for AlphabeTwo
                                    HStack {
                                        
                                        ForEach(0..<alphabetTwo.count) {rowTwo in
                                            
                                            FormatTile(alphabet: self.alphabetTwo[rowTwo])
                                                .background(Color.green)
                                            
                                            
                                        }
                                    }//End of HStack on Row Two
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetThree
                                    HStack {
                                        
                                        ForEach(0..<alphabetThree.count) {rowThree in
                                            
                                            FormatTile(alphabet: self.alphabetThree[rowThree])
                                                .background(Color.red)
                                            
                                        }
                                        
                                        
                                        
                                    }//End of Hstack on Row Three
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetFour
                                    HStack {
                                        
                                        
                                        ForEach(0..<alphabetFour.count) {rowFour in
                                            
                                            FormatTile(alphabet: self.alphabetFour[rowFour])
                                                .background(Color.init(red: 0.2, green: 0.7, blue: 0.6))
                                            
                                            
                                        }
                                        
                                        
                                    }//End of HStack
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetFive
                                    HStack {
                                        
                                        ForEach(0..<alphabetFive.count) {rowFive in
                                            
                                            FormatTile(alphabet: self.alphabetFive[rowFive])
                                                .background(Color.blue)
                                            
                                            
                                        }
                                        
                                    }//End of Hstack alphabeFive
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    /*
                                    
                                   //HStack for AlphabetSix
                                    HStack {
                                        
                                        ForEach(0..<alphabetSix.count) {rowSix in
                                            
                                            FormatTile(alphabet: self.alphabetSix[rowSix])
                                               
                                            
                                            
                                        }
                                        
                                    }//End of Hstack alphabeSix
                                    
                                    */
                                    
                                    
                                    
                                }//End of VStack
                                
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
