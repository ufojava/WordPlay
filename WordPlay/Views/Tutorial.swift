//
//  Tutorial.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 31/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//Help View
import SwiftUI


struct GameHelp: View {
    
    @State private var toggleImageOne = false
    @State private var toggleImageTwo = false
    @State private var toggleImageThree = false
    @State private var toggleImageFour = false
    
    //Animate each insructions
    @State private var showIsntructionOne = false
    @State private var showIsntructionTwo = false
    @State private var showIsntructionThree = false
    @State private var showIsntructionFour = false
    
    @State private var startTalking = false
    
    //Variables to control guilds
    @State private var instructionsCounter = 0
 
    
    
    
    
    var body: some View {
        
        VStack {
    
            ZStack {
                
                
                //Background Image
                Image("4LettersOtherScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                    .onAppear() {
                        
                       /*
                        withAnimation {
                        
                                self.showIsntructionOne = true
                                    
                        }
                        */
                    
                        withAnimation {
                            
                            self.showIsntructionTwo = true
                                
                        }
                        
                   
                        withAnimation {
                            
                            self.showIsntructionThree = true
                                
                        }
                        
                        withAnimation {
                            
                            self.showIsntructionFour = true
                                
                        }
                        
                       
                                            
                }
                
                
                
                
                VStack {
                            
                    HStack {
                   
                    
                            Text("Tutorial: Click 👉🏾 ").foregroundColor(Color.white).font(.system(size: 25))
                                .onAppear() {
                                    
                                    self.startTalking.toggle()
                                    
                                    if self.startTalking {
                                        
                                    gameSynthSpeechFemale(word: "Welcome to the tutorial.")
                                    
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        
                                        gameSynthSpeechFemale(word: "Read the instructions below on how to use the guide")
                                    }
                                    
                                    
                                    
                            }
                        
                        Button(action: {
                            
                            //Check the status of the counter
                            if self.instructionsCounter >= 4 {
                                
                                self.instructionsCounter = 0
                            }//End of instruction counter check
                            
                            //Add to counter
                            
                            if self.instructionsCounter >= 0 && self.instructionsCounter <= 3 {
                                
                            self.instructionsCounter += 1
                            }
                            
                            if self.instructionsCounter == 1 {
                                withAnimation {
                                    
                                    self.showIsntructionOne = true
                                    
                                }
                                
                            }
                            
                        }) {
                            
                            
                            Text("Instruction: \(self.instructionsCounter)")
                                .frame(width:150,height:50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                        }
                        
                        
                                  
                    }//End of HStack
                        
                    Spacer().frame(height:10)
                    
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading) {
                            Text("1. Click on the instruction button")
                            Text("2. Toggle Image to shrink and enlarge")
                            Text("3. There are 4 instructions")
                            Text("4. Click on text for voice assistance")
                        
                        }.foregroundColor(Color.white)
                           
                        
                        
                        if self.showIsntructionOne && self.instructionsCounter == 1 {
                    
                            HStack {//Help One
                                
                                
                        
                                Text("1").foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                                
                                Text("Select play game to begin").foregroundColor(Color.white)
                                    .onTapGesture {
                                        
                                        //self.startTalking.toggle()
                                        
                                        if self.startTalking {
                                        gameSynthSpeechFemale(word: "Select Play Game to begin. Your aim is to create as many four letter words within the 3 mins. Tile rack must be clear before forming new words")
                                            
                                        }
                                }
                                
                                Spacer().frame(width:30)
                                
                                Image("Help_SelectGAme")
                                       .resizable()
                                       .frame(width:30,height: 75)
                                       .scaledToFill()
                                    
                                    
                                       
                                           .onTapGesture {
                                            
                                            withAnimation {
                                               self.toggleImageOne.toggle()
                                            }
                                            
                                            //Check status of ToggleTwo
                                            if self.toggleImageTwo {
                                                
                                                withAnimation {
                                                self.toggleImageTwo.toggle()
                                                }
                                            }
                                            
                                            //Check status of ToggleThree
                                            if self.toggleImageThree {
                                                
                                                withAnimation {
                                                
                                                    self.toggleImageThree.toggle()
                                                }
                                            }
                                            
                                            //Check status of ToggleFour
                                            if self.toggleImageFour {
                                                
                                                withAnimation {
                                                
                                                    self.toggleImageFour.toggle()
                                                }
                                            }
                                               
                                               
                                    }
                                    
                                
                                }.transition(.move(edge: .leading))//End Guide One
                        
                        
                        }//End of Instruction One
                        
                        
                        
                        if self.showIsntructionTwo && self.instructionsCounter == 2 {
                        
                        HStack {//Help Two
                            
                            Text("2").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Form a word from the colored").foregroundColor(Color.white)
                                .onTapGesture {
                                    if self.startTalking {
                                        
                                        gameSynthSpeechFemale(word: "The letters are shuffled every few minutes, so take care when forming your word")
                                        
                                    }
                            }
                            
                            Image("Help_GameInstructions")
                                .resizable()
                                   .frame(width:30,height: 75)
                                   .scaledToFill()
                                   
                                       .onTapGesture {
                                        
                                        withAnimation {
                                            
                                           self.toggleImageTwo.toggle()
                                        }
                                        
                                        //Check status of ToggleOne
                                        if self.toggleImageOne {
                                        
                                            withAnimation {
                                            
                                            self.toggleImageOne.toggle()
                                            }
                                        }
                                        
                                        //Check status of ToggleThree
                                        if self.toggleImageThree {
                                            
                                            withAnimation {
                                                self.toggleImageThree.toggle()
                                            }
                                        }
                                        
                                        //Check status of ToggleFour
                                        if self.toggleImageFour {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageFour.toggle()
                                            }
                                        }
                                           
                                           
                                }//End of guide two
                            
                        }.transition(.move(edge: .leading))
                        
                        }//End on Instruction Two
                        
                        
                        if self.showIsntructionThree && self.instructionsCounter == 3 {
                        
                        HStack {
                            
                            Text("3").foregroundColor(Color.white)
                                .frame(width: 40, height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Previous words stored").foregroundColor(Color.white)
                                .onTapGesture {
                                    
                                    gameSynthSpeechFemale(word: "Previous words cannot be replayed. Words played will be displayed as you play. If you replay, points will be deducted")
                            }
                                
                            Spacer().frame(width:68)
                                
                                
                                Image("Help_New_Word")
                                    .resizable()
                                    .frame(width:30,height: 75)
                                
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.toggleImageThree.toggle()
                                    }
                                    //Check status of ToggleOne
                                    if self.toggleImageOne {
                                        
                                        withAnimation {
                                        
                                            self.toggleImageOne.toggle()
                                        }
                                    }
                                    
                                    //Check status of ToggleTwo
                                    if self.toggleImageTwo {
                                        withAnimation {
                                        
                                            self.toggleImageTwo.toggle()
                                        }
                                    }
                                    
                                    //Check status of ToggleFour
                                    if self.toggleImageFour {
                                        withAnimation {
                                        
                                            self.toggleImageFour.toggle()
                                        }
                                    }
                                    
                            }
                                
                            
                            
                        }.transition(.move(edge: .leading))//End HStack for guide three
                            
                        }//End of Instruction three
                        
                        
                        if self.showIsntructionFour && self.instructionsCounter == 4 {
                        
                        HStack {
                            
                            Text("4").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Memorised Word").foregroundColor(Color.white)
                                .onTapGesture {
                                    gameSynthSpeechFemale(word: "You can earn between 100 and 250 points on the number of words formed within 3 and 2 minutes. Now familiarise yourself with the play screen clicking on the images. Good luck")
                            }
                            
                            //Create space to align
                            Spacer().frame(width:109)
                            
                            Image("Help_Word_Memorised")
                                .resizable()
                                .frame(width:30,height: 75)
                            
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.toggleImageFour.toggle()
                                        
                                    }
                                    //Check Status One
                                    if self.toggleImageOne {
                                        
                                        withAnimation {
                                            self.toggleImageOne.toggle()
                                        }
                                    }
                                    
                                    //Check Status Two
                                    if self.toggleImageTwo {
                                        
                                        withAnimation {
                                            self.toggleImageTwo.toggle()
                                        }
                                    }
                                    
                                    //Check Status three
                                    if self.toggleImageThree {
                                        
                                        withAnimation {
                                            self.toggleImageThree.toggle()
                                        }
                                    }
                                    
                                    
                                
                            }
                            
                            
                        }.transition(.move(edge: .leading))//End of HStack gude four
                        
                        
                        }//End on instruction Four
                        
                        
                    
                        
                    }//Vstack for the guide
                    
                    if self.toggleImageOne {
                        
                        
                        ImageSize(userImage: "Help_SelectGAme").transition(.move(edge: .leading))
                            
                        
                    }
                    
                    if self.toggleImageTwo {
                    
                        
                        ImageSize(userImage: "Help_GameInstructions").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageThree {
                        
                        ImageSize(userImage: "Help_New_Word").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageFour {
                        
                        ImageSize(userImage: "Help_Word_Memorised").transition(.move(edge: .leading))
                    }
                    
                    
                    Spacer()
                }
    
        
                
            }
            
        }
    }
    
}




//Preview for GameHelp
struct GameHelp_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GameHelp()
    }
    
}

//Struct to toggle between large and small image
struct ImageSize: View {
    
    var userImage = ""
    
    var body: some View {
        
        Image(userImage)
            .resizable()
            .frame(width:240,height: 400)
            .scaledToFill()
        
    }
}
