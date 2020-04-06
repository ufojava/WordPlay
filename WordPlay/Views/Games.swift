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
        
        
        //NavigationView {
        
        
        //Text("Place HOlder")
        fourLetter()
        
            
        }
        
   //}
    
    
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
    @State private var alphabetOne = ["A","B","Z","X","Y"].shuffled()
    @State private var alphabetTwo = ["C","D","P","O","K"].shuffled()
    @State private var alphabetThree = ["T","W","N","F","I"].shuffled()
    @State private var alphabetFour = ["L","S","U","H","E"].shuffled()
    @State private var alphabetFive = ["G","Q","R","J","V"].shuffled()
    @State private var alphabetSix = ["M"]
    
    
    //Timer for alphabets
    @State private var shuffleAlphabetTimer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    //Letter Selector Counter
    @State private var playAlphabetCounter = 0
    
    //Game Timer
    @State private var gameTimeLimit = 3
    @State private var gameTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    //Scoring
    @State private var correctBaseScore = 0
    @State private var correctWordCounter = 0
   
    
    
    //Played words
    @State private  var playedWordsOne: [String] = []
    @State private var playedWordsTwo: [String] = []
    @State private var playedWordsThree: [String] = []
    
    
    //Palyer Progress
    @State private var playMaxScore = 850 //Projected maximum score in one game
    
    @State private var playerHealthRed = false
    @State private var playerRedOpacity = 0.0
    @State private var playerRedCounter = 0
    
    @State private var playerHealthOrange = false
    @State private var playerOrangeOpacity = 0.0
    @State private var playerOrangeCounter = 0
    
    
    
    @State private var playerHealthGreen = false
    @State private var playerGreenOpacity = 0.0
    @State private var playerGreenCounter = 0
    
    

    
    
    
    
    
    //Function to check word
    func checkWord(inWord: String) {
        
   
        
        let srchRecord = allWords.dataStructure.filter {$0.word == inWord}
        let memoryArrayOne = self.playedWordsOne.contains(inWord)
        
        
        
        if srchRecord.indices.contains(0) && self.gameTimeLimit != 0 {
            
            if memoryArrayOne {
                gameSynthSpeech(word: "Word has been played. 20 points deducted")
                
                //Deducct 20 points
                self.correctBaseScore -= 20
             
                return
            } else {
            
            self.correctBaseScore += 20
            self.correctWordCounter += 1
            
            //Word played
                gameSynthSpeechFemale(word: self.collectAllUserInputs)
            //print(srchRecord[0])
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                //Pronounce score
                gameSynthSpeech(word: "\(self.correctBaseScore)")
        
                }
                    //Add Bonus score for 3 minites
                if (self.correctWordCounter >= 5 && self.correctWordCounter <= 9) && self.gameTimeLimit == 3  {
                        

                    //Add Bonus Point
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.correctBaseScore += 30 //Add 100 Bonus Points
                        gameSynthSpeech(word: "30 Bonus Points Added")
                    }
                        
                } else if (self.correctWordCounter >= 10 && self.correctWordCounter <= 15) && self.gameTimeLimit == 3 && self.correctBaseScore <= 100 {
                        
                        
                    
                    //Add Bonus Point
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        
                        self.correctBaseScore += 250 //Add 250 Bonus Points
                        gameSynthSpeech(word: "250 Bonus Points Added")
                    }
                        
                        
                        //Add bonus fo 2 Mins
                } else if (self.correctWordCounter >= 5 && self.correctWordCounter <= 9) && self.gameTimeLimit == 2 && self.correctBaseScore <= 250 {
                        
                        
                    
                    //Add Bonus Point
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        
                        self.correctBaseScore += 30 //Add 30 points
                        gameSynthSpeech(word: "30 Bonus Points Added")
                    }
                        
                } else if (self.correctWordCounter >= 10 && self.correctWordCounter <= 15) && self.gameTimeLimit == 2  && self.correctBaseScore <= 250 {
                        
                        
                    
                    //Add Bonus Point
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        
                        self.correctBaseScore += 50 //Add 50 points
                        gameSynthSpeech(word: "50 Bonus Points Added")
                    }
                        
                    } 
            }
        } else if srchRecord.indices.contains(0) == false && self.gameTimeLimit != 0 {
            
            gameSynthSpeech(word: "Not a valid 4 letter word")
            
            //Deduct 20 points
            self.correctBaseScore -= 20
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                gameSynthSpeech(word: "20 points deducted")
            }
            
        } else {
            
            gameSynthSpeech(word: "Game is over. Your final score is \(self.correctBaseScore)")
        }
        
    }//end of Check word
    
   
    //Function to apply health to player
    func playerHealth() {
        
        if self.correctBaseScore >= 50 && self.correctBaseScore <= 99 {
            
            self.playerRedOpacity = 1.0
            
            //Play health milestone
            
            if self.playerRedCounter == 0 {
                
            playAudioFile(sound: "50Points_Reached", type: "mp3")
                
                //Add to counter
                self.playerRedCounter += 1
            
            //Encorage to attain 100 points
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                
                playAudioFile(sound: "100_Points_AmberEncouragement", type: "mp3")
                
                
                
            }
            }
        }
        
        
        if self.correctBaseScore >= 100 && self.correctBaseScore <= 399 {
            
            self.playerOrangeOpacity = 1.0
            
            //Play health milestone 100 reached
            
            if self.playerOrangeCounter == 0 {
                
                //Add to counter
                self.playerOrangeCounter += 1
                
                
            playAudioFile(sound: "100_Points_Amber_Reached", type: "mp3")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                
                playAudioFile(sound: "400_Points_Green_Encorage", type: "mp3")
                
                
            }
            }
        }
        
        if self.correctBaseScore >= 400 && self.correctBaseScore <= 850 {
            
            self.playerGreenOpacity = 1.0
            
            //Play heath milesone 400
            
            if self.playerGreenCounter == 1 {
                
                self.playerGreenCounter += 1
                
                
                playAudioFile(sound: "400_Points_Reached", type: "mp3")
            }
            
            
        }
        
    }

  
    

    
    
    
    var body: some View {
        
        
    
        ZStack {
            
                    Image("4LettersOtherScreen")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            
                        .onAppear() {
                        
                            //Play audo encoraging 50 points
                            playAudioFile(sound: "50Points_Tip", type: "mp3")
                            
                        }
            
                                        
            
                            VStack {
                                      
                                VStack {
                                    
                                    HStack {
                                        
                                        Text("Health Bar 🌡").font(.system(size: 20)).foregroundColor(Color.white)
                                    
                                    Rectangle()
                                        .frame(width:50,height:10)
                                        .foregroundColor(Color.red)
                                        .opacity(self.playerRedOpacity)
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                        
                                        
                                    Rectangle()
                                        .frame(width:50,height:10)
                                        .foregroundColor(Color.orange)
                                        .opacity(self.playerOrangeOpacity)
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                        
                                        
                                    Rectangle()
                                        .frame(width:50,height:10)
                                        .foregroundColor(Color.green)
                                        .opacity(self.playerGreenOpacity)
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                                        
                                        
                                    }
                                    Spacer().frame(height:5)
                                
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
                                    
                                    
                                
                                }//End of ZStack
                                    
                                }
                                HStack {
                                
                                    
                                    Button(action: {
                                        
                                        self.stateOfAllUserInputs.toggle()
                                        self.collectAllUserInputs = self.userLetterOne + self.userLetterTwo + self.userLetterThree + self.userLetterFour
                                   
                                        //Process word input
                                        self.checkWord(inWord: self.collectAllUserInputs)
                                        
                                        //Process Player Health
                                        self.playerHealth()
                                        
                                        //Clear Screen
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            
                                            self.userLetterOne = ""
                                            self.userLetterTwo = ""
                                            self.userLetterThree = ""
                                            self.userLetterFour = ""
                                            self.playAlphabetCounter = 0
                                            self.stateOfAllUserInputs.toggle()
                                        }
                                        
                                        
                                        //Append entry into array
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            
                                            if self.playedWordsOne.capacity <= 10 {
                                                self.playedWordsOne.append(self.collectAllUserInputs)
                                                
                                            } else if self.playedWordsTwo.capacity <= 10 {
                                                
                                                self.playedWordsTwo.append(self.collectAllUserInputs)
                                                
                                            } else {
                                                
                                                self.playedWordsThree.append(self.collectAllUserInputs)
                                            }
                                            
                                            
                                        }
                                        
                                        
                                    }) {
                                        
                                        Text("Play Word").foregroundColor(Color.white)
                                            .frame(width:100,height: 30)
                                            .background(Color.blue)
                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
                                        
                                        
                                        
                                    }
                                    
                                
                                    
                                  //Countdown Timer
                                    Text("Timer: \(self.gameTimeLimit)").foregroundColor(Color.white)
                                    .frame(width:100,height: 30)
                                    .background(Color.red)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
                                    
                                        .onReceive(self.gameTimer) { time in
                                            
                                            if self.gameTimeLimit == 0 {
                                                
                                                self.gameTimer.upstream.connect().cancel() //Stop Game Timer
                                                
                                                
                                            } else {
                                                
                                                self.gameTimeLimit -= 1
                                            }
                                            
                                            
                                            
                                    }//End of Counter Timer
                                    
                                    //Score
                                    Text("Score: \(self.correctBaseScore)").foregroundColor(Color.white)
                                    .frame(width:100,height: 30)
                                    .background(Color.green)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 3))
                                    
                                    
                                }//End of HStack
                                
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
                                                                
                                                                //Speak Letter
                                                                gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                            } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterTwo = self.alphabetOne[rowOne]
                                                                
                                                                //Speak Letter
                                                                gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                              
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                            } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterThree = self.alphabetOne[rowOne]
                                                                
                                                                
                                                                //Speak Letter
                                                                gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                                
                                                                //Add play to counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                                
                                                            } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                                
                                                                self.userLetterFour = self.alphabetOne[rowOne]
                                                                
                                                                //Speak Letter
                                                                gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                          
                                                                
                                                                //Add to Play counter
                                                                self.playAlphabetCounter += 1
                                                                
                                                                
                                                            }
                                                    }//End on OnTapGesture
                                                        
                                                        //Shuffle Row One
                                                        .onReceive(self.shuffleAlphabetTimer) {time in
                                                            
                                                            if self.gameTimeLimit == 0 {
                                                            
                                                               self.shuffleAlphabetTimer.upstream.connect().cancel() //Stop aplhabet timer
                                                            
                                                            } else {
                                                                
                                                                self.alphabetOne.shuffle()
                                                                
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
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                    
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetTwo[rowTwo]
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetTwo[rowTwo]
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetTwo[rowTwo]
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }//End on Ontap Geesture
                                                
                                                //Shuffle Row two
                                                .onReceive(self.shuffleAlphabetTimer) {time in
                                                    
                                                    self.alphabetTwo.shuffle()
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
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetThree[rowThree]
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetThree[rowThree]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetThree[rowThree]
                                                        
                                                       //Speak Letter
                                                       gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                                    
                                            }//End onTap Gesture
                                                
                                                //Shuffle Row three
                                                .onReceive(self.shuffleAlphabetTimer) { time in
                                                    
                                                    self.alphabetThree.shuffle()
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
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetFour[rowFour]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetFour[rowFour]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetFour[rowFour]
                                                        
                                                       //Speak Letter
                                                       gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }//End of OntapGetsure Row four
                                                
                                                //Shuffle Row four
                                                .onReceive(self.shuffleAlphabetTimer) { time in
                                                    
                                                    self.alphabetFour.shuffle()
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
                                                        
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterTwo = self.alphabetFive[rowFive]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                    } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterThree = self.alphabetFive[rowFive]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                        
                                                        //Add play to counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                        
                                                        self.userLetterFour = self.alphabetFive[rowFive]
                                                        
                                                        //Speak Letter
                                                        gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                        
                                                        //Add to Play counter
                                                        self.playAlphabetCounter += 1
                                                        
                                                        
                                                    }
                                            }//End of OnTapGesture
                                                
                                                //Shuffle Row five
                                                .onReceive(self.shuffleAlphabetTimer) { time in
                                                    
                                                    self.alphabetFive.shuffle()
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
                                                    
                                                    //Speak Letter
                                                    gameSynthSpeechFemale(word: "\(self.userLetterOne.lowercased())")
                                                    
                                                
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                } else if self.playAlphabetCounter == 1 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterTwo = self.alphabetSix[rowSix]
                                                    
                                                    //Speak Letter
                                                    gameSynthSpeechFemale(word: "\(self.userLetterTwo.lowercased())")
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                } else if self.playAlphabetCounter == 2 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterThree = self.alphabetSix[rowSix]
                                                    
                                                    //Speak Letter
                                                    gameSynthSpeechFemale(word: "\(self.userLetterThree.lowercased())")
                                                    
                                                    //Add play to counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                    
                                                } else if self.playAlphabetCounter == 3 && self.playAlphabetCounter < 5 {
                                                    
                                                    self.userLetterFour = self.alphabetSix[rowSix]
                                                    
                                                    //Speak Letter
                                                    gameSynthSpeechFemale(word: "\(self.userLetterFour.lowercased())")
                                                    
                                                    //Add to Play counter
                                                    self.playAlphabetCounter += 1
                                                    
                                                    
                                                }
                                        }
                                        
                                    }
                                    
                                }
                                
                            
        
                             
                                Spacer().frame(height:5)
                                VStack {
                                Text("Word(s) Played")
                                    .foregroundColor(Color.white)
                                      Spacer().frame(height:5)
                                }
                                
                                VStack {//list Play Words
            
                                HStack {
                                    
                                  
                                    
                                ForEach(self.playedWordsOne,id: \.self) { wordsPlayed in
                                    
                                    Text("\(wordsPlayed)")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10))
                                    
                                }
                                    
                                }//End of HStack for words played
                                
                                HStack {
                                   
                                ForEach(self.playedWordsTwo,id: \.self) { wordsPlayed in
                                    
                                    Text("\(wordsPlayed)")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10))
                                    
                                }
                                 
                                }//End of HStack Playword Two
                                    
                                HStack {
                                   
                                ForEach(self.playedWordsThree,id: \.self) { wordsPlayed in
                                    
                                    Text("\(wordsPlayed)")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10))
                                    
                                }
                                 
                                }//End of HStack Playword Three
                                    
                                    
                                    
                                    
                                }//End of VStack
                            
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
