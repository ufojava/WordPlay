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
    
    //Letter Selector Counter
    @State private var playAlphabetCounter = 0
    
    //Played words
    @State private var playedWords: [String] = []
    
    
    
    
    
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
                                        
                                        Text("\(self.userLetterOne)").multilineTextAlignment(.center).foregroundColor(Color.white)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                           
                                        Text("\(self.userLetterTwo)").multilineTextAlignment(.center).foregroundColor(Color.white)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        
                                        Text("\(self.userLetterThree)").multilineTextAlignment(.center).foregroundColor(Color.white)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        Text("\(self.userLetterFour)").multilineTextAlignment(.center).foregroundColor(Color.white)
                                            .frame(width:50, height:50)
                                            .background(Color.gray)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3)).padding()
                                        
                                        
                                }.padding()
                                
                                }
                                HStack {
                                
                                    
                                    Button(action: {
                                        
                                        self.stateOfAllUserInputs.toggle()
                                        self.collectAllUserInputs = self.userLetterOne + self.userLetterTwo + self.userLetterThree + self.userLetterFour
                                        self.playedWords.append(self.collectAllUserInputs)
                                        
                                        
                                        //Clear Screen
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            
                                            self.userLetterOne = ""
                                            self.userLetterTwo = ""
                                            self.userLetterThree = ""
                                            self.userLetterFour = ""
                                            self.playAlphabetCounter = 0
                                            self.stateOfAllUserInputs.toggle()
                                        }
                                        
                                        
                                    }) {
                                        
                                        Text("Play Word").foregroundColor(Color.white)
                                            .frame(width:100,height: 30)
                                            .background(Color.blue)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                        
                                        
                                        
                                    }
                                    
                                  
                                    
                                }
                                
                                Spacer().frame(height:40)
                                
                                VStack {
                                
                                            //HStack for AlphabeOne
                                            HStack {
                                                
                                                ForEach(0..<alphabetOne.count) {rowOne in
                                                
                                                    
                                                    FormatTile(alphabet: self.alphabetOne[rowOne])
                                                        .background(Color.orange)
                                                    
                                                        .onTapGesture {
                                                            print(self.alphabetOne[rowOne])
                                                            
                                                            if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterOne = self.alphabetOne[rowOne]
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                            } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterTwo = self.alphabetOne[rowOne]
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                            } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterThree = self.alphabetOne[rowOne]
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                                
                                                            } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterFour = self.alphabetOne[rowOne]
                                                                
                                                                //Add to Play counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                                
                                                            }
                                                    }
                                                
                                                        
                                                
                                            }
                                            
                                            
                                            }//End of HStack on Row one
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    
                                    //HStack for AlphabeTwo
                                    HStack {
                                        
                                        ForEach(0..<alphabetTwo.count) {rowTwo in
                                            
                                            FormatTile(alphabet: self.alphabetTwo[rowTwo])
                                                .background(Color.green)
                                            
                                                .onTapGesture {
                                                    if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterOne = self.alphabetTwo[rowTwo]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetTwo[rowTwo]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetTwo[rowTwo]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetTwo[rowTwo]
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }
                                            
                                            
                                        }
                                    }//End of HStack on Row Two
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetThree
                                    HStack {
                                        
                                        ForEach(0..<alphabetThree.count) {rowThree in
                                            
                                            FormatTile(alphabet: self.alphabetThree[rowThree])
                                                .background(Color.red)
                                            
                                                .onTapGesture {
                                                    
                                                    if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterOne = self.alphabetThree[rowThree]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetThree[rowThree]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetThree[rowThree]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetThree[rowThree]
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                                    
                                            }
                                            
                                        }
                                        
                                        
                                        
                                    }//End of Hstack on Row Three
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetFour
                                    HStack {
                                        
                                        
                                        ForEach(0..<alphabetFour.count) {rowFour in
                                            
                                            FormatTile(alphabet: self.alphabetFour[rowFour])
                                                .background(Color.init(red: 0.2, green: 0.7, blue: 0.6))
                                            
                                                .onTapGesture {
                                                    if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterOne = self.alphabetFour[rowFour]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetFour[rowFour]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetFour[rowFour]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetFour[rowFour]
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }
                                            
                                            
                                        }
                                        
                                        
                                    }//End of HStack
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                    //HStack for AlphabetFive
                                    HStack {
                                        
                                        ForEach(0..<alphabetFive.count) {rowFive in
                                            
                                            FormatTile(alphabet: self.alphabetFive[rowFive])
                                                .background(Color.blue)
                                                .onTapGesture {
                                                    if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterOne = self.alphabetFive[rowFive]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetFive[rowFive]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetFive[rowFive]
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetFive[rowFive]
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }
                                            
                                            
                                        }
                                        
                                    }//End of Hstack alphabeFive
                                    
                                    Spacer().frame(height:5) //Space between alphabets
                                    
                                   
                                    
                                    
                                }//End of VStack
                                
                                HStack {
                                    
                                    ForEach(0..<alphabetSix.count) {rowSix in
                                        
                                        
                                        FormatTile(alphabet: self.alphabetSix[rowSix])
                                            .background(Color.init(red: 0.1, green: 0.4, blue: 0.2))
                                        
                                            .onTapGesture {
                                                if self.playAlphabetCounter == 0 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterOne = self.alphabetSix[rowSix]
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterTwo = self.alphabetSix[rowSix]
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterThree = self.alphabetSix[rowSix]
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                    
                                                } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterFour = self.alphabetSix[rowSix]
                                                    
                                                    //Add to Play counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                    
                                                }
                                        }
                                        
                                    }
                                    
                                }
                                
                                if stateOfAllUserInputs {
                                    
                                    Text(checkWord(inWord: self.collectAllUserInputs))
                                    
                                }
                                
                                Spacer().frame(height:5)
                                VStack {
                                Text("Word(s) Played")
                                    .foregroundColor(Color.white)
                                      Spacer().frame(height:5)
                                }
            
                            
                                    
                                ForEach(self.playedWords,id: \.self) { wordsPlayed in
                                    
                                    Text("\(wordsPlayed)")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10))
                                    
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
