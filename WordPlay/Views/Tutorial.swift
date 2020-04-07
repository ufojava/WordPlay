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
    @State private var toggleImageFive = false
    @State private var toggleImageSix = false
    
    //Animate each insructions
    @State private var showIsntructionOne = false
    @State private var showIsntructionTwo = false
    @State private var showIsntructionThree = false
    @State private var showIsntructionFour = false
    @State private var showIsntructionFive = false
    @State private var showIsntructionSix = false
    
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
                            if self.instructionsCounter >= 6 {
                                
                                self.instructionsCounter = 0
                            }//End of instruction counter check
                            
                            //Add to counter
                            
                            if self.instructionsCounter >= 0 && self.instructionsCounter <= 5 {
                                
                            self.instructionsCounter += 1
                            }
                            
                            
                            //Enable animaation for the four instructions
                            if self.instructionsCounter == 1 {
                                
                                //Check status of instruction Six
                                if self.showIsntructionSix {
                                    
                                    self.showIsntructionSix.toggle()
                                    self.toggleImageSix.toggle()
                                }
                                
                                withAnimation {
                                    
                                    
                                    self.showIsntructionOne.toggle()
                                    
                                }
                            }
                                
                                if self.instructionsCounter == 2 {
                                    
                                    //Check status of instruction one
                                    if self.showIsntructionOne {
                                        
                                        self.showIsntructionOne.toggle()
                                        self.toggleImageOne.toggle()
                                    }
                                    
                                    withAnimation {
                                        
                                        
                                        self.showIsntructionTwo.toggle()
                                    }
                                }
                                
                            if self.instructionsCounter == 3 {
                                
                                //Check status of instruction two
                                if self.showIsntructionTwo {
                                    
                                    self.showIsntructionTwo.toggle()
                                    self.toggleImageTwo.toggle()
                                }
                                
                                withAnimation {
                                    
                                    self.showIsntructionThree.toggle()
                                }
                            }
                            
                            if self.instructionsCounter == 4 {
                                
                                //Check status of instruction three
                                if self.showIsntructionThree {
                                    
                                    self.showIsntructionThree.toggle()
                                    self.toggleImageThree.toggle()
                                }
                                
                                withAnimation {
                                    
                                    self.showIsntructionFour.toggle()
                                }
                            }
                            
                            
                            if self.instructionsCounter == 5 {
                                
                                //Check status of instruction Four
                                if self.showIsntructionFour {
                                    
                                    self.showIsntructionFour.toggle()
                                    self.toggleImageFour.toggle()
                                }
                                
                                withAnimation {
                                    
                                    self.showIsntructionFive.toggle()
                                }
                            }
                            
                            
                            if self.instructionsCounter == 6 {
                                
                                //Check status of instruction Five
                                if self.showIsntructionFive {
                                    
                                    self.showIsntructionFive.toggle()
                                    self.toggleImageFive.toggle()
                                }
                                
                                withAnimation {
                                    
                                    self.showIsntructionSix.toggle()
                                }
                            }
                            
                            
                            
                                
                            
                        }) {
                            
                            
                            Text("Next: \(self.instructionsCounter)")
                                .frame(width:130,height:50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                        }
                        
                        
                                  
                    }//End of HStack
                        
                    Spacer().frame(height:10)
                    
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading) {
                            Text("1. Click icon to enlarge image")
                            Text("2. Click the text for voice assitance")
                            Text("3. There are 6 instructions")
                            Text("4. You can recycle the help")
                        
                        }   .frame(width:400,height: 90)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white,lineWidth: 2))
                            
                           
                        
                        
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
                                        gameSynthSpeechFemale(word: "Select Play Game to begin. Try and form as many 4 letter words within the 3 minutes allowed")
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                                
                                               gameSynthSpeechFemale(word: "Allow the tile rack to clear before selecting letters. Click Next to continue")
                                                
                                            }
                                            
                                        }
                                }
                                
                                Spacer().frame(width:60)
                                
                                Image("Help_MainPageMap")
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
                                            
                                            //Check status of ToggleFive
                                            if self.toggleImageFive {
                                                
                                                withAnimation {
                                                
                                                    self.toggleImageFive.toggle()
                                                }
                                            }
                                            
                                            //Check status of ToggleSix
                                            if self.toggleImageSix {
                                                
                                                withAnimation {
                                                
                                                    self.toggleImageSix.toggle()
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
                            
                            
                            
                            Text("Game Layout").foregroundColor(Color.white)
                                .onTapGesture {
                                    if self.startTalking {
                                        
                                        gameSynthSpeechFemale(word: "Familiarise youself with the game layout")
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                            
                                            gameSynthSpeechFemale(word: "Click on Next for more instructions")
                                        }
                                        
                                    }
                            }
                            
                            //Create space
                            Spacer().frame(width:140)
                            
                            Image("Help_Map")
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
                                        
                                        //Check status of ToggleFive
                                        if self.toggleImageFive {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageFive.toggle()
                                            }
                                        }
                                        
                                        //Check status of ToggleFive
                                        if self.toggleImageSix {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageSix.toggle()
                                            }
                                        }
                                          
                                           
                                           
                                }//End of guide two
                            
                        }.transition(.move(edge: .leading))
                        
                        }//End on Instruction Two
                        
                        
                        
                        
                        
                
                        
                        if self.showIsntructionThree && self.instructionsCounter == 3 {
                        
                        HStack {//Help Three
                            
                            Text("3").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Form a word from the colored").foregroundColor(Color.white)
                                .onTapGesture {
                                    if self.startTalking {
                                        
                                        gameSynthSpeechFemale(word: "The letters are shuffled every few seconds, so take care when forming your word")
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                            
                                            gameSynthSpeechFemale(word: "Click on next for more")
                                        }
                                        
                                    }
                            }
                            
                            Spacer().frame(width:20)
                            Image("Help_Tiles")
                                .resizable()
                                   .frame(width:30,height: 75)
                                   .scaledToFill()
                                   
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
                                        
                                        //Check status of ToggleFive
                                        if self.toggleImageFive {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageFive.toggle()
                                            }
                                        }
                                        
                                        //Check status of ToggleSix
                                        if self.toggleImageSix {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageSix.toggle()
                                            }
                                        }
                                          
                                           
                                           
                                }//End of guide three
                            
                        }.transition(.move(edge: .leading))
                        
                        }//End on Instruction Three
                        
                        
                        if self.showIsntructionFour && self.instructionsCounter == 4 {
                        
                        HStack {
                            
                            Text("4").foregroundColor(Color.white)
                                .frame(width: 40, height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Click play to accept word").foregroundColor(Color.white)
                                .onTapGesture {
                                    
                                    if self.startTalking {
                                    
                                    gameSynthSpeechFemale(word: "Played word will be matched agianst dictionary.")
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                            
                                            gameSynthSpeechFemale(word: "Incorrect or replayed words will trigger a dedcution of 20 points")
                                            
                                        }
                                        
                                    }
                            }
                                
                            Spacer().frame(width:68)
                                
                                
                                Image("Help_PlayButton")
                                    .resizable()
                                    .frame(width:30,height: 75)
                                
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.toggleImageFour.toggle()
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
                                    
                                        //Check status of ToggleThree
                                        if self.toggleImageThree {
                                            
                                            withAnimation {
                                            
                                                self.toggleImageThree.toggle()
                                            }
                                        }
                                    
                                    //Check status of ToggleFive
                                   if self.toggleImageFive {
                                       
                                       withAnimation {
                                       
                                           self.toggleImageFive.toggle()
                                       }
                                   }
                                    
                                //Check status of ToggleSix
                                if self.toggleImageSix {
                                    
                                    withAnimation {
                                    
                                        self.toggleImageSix.toggle()
                                    }
                                }
                                    
                            }
                                
                            
                            
                        }.transition(.move(edge: .leading))//End HStack for guide three
                            
                        }//End of Instruction four
                        
                        
                        if self.showIsntructionFive && self.instructionsCounter == 5 {
                        
                        HStack {
                            
                            Text("5").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Words played are memorised").foregroundColor(Color.white)
                                .onTapGesture {
                                    
                                    if self.startTalking {
                                        
                                    gameSynthSpeechFemale(word: "Words played are displayed at the bottom of the tiles. 20 point deduction for a replay of these words")
                                    }
                            }
                            
                            //Create space to align
                            Spacer().frame(width:70)
                            
                            Image("Help_WordPlayed")
                                .resizable()
                                .frame(width:30,height: 75)
                            
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.toggleImageFive.toggle()
                                        
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
                                    
                                    if self.toggleImageFour {
                                        
                                        withAnimation {
                                        
                                            self.toggleImageFour.toggle()
                                        }
                                    }
                                    
                                //Check status of ToggleSix
                                if self.toggleImageSix {
                                    
                                    withAnimation {
                                    
                                        self.toggleImageSix.toggle()
                                    }
                                }
                                    
                                    
                                
                            }
                            
                            
                        }.transition(.move(edge: .leading))//End of HStack gude five
                        
                        
                        }//End on instruction Five
                        
                        
                        if self.showIsntructionSix && self.instructionsCounter == 6 {
                        
                        HStack {
                            
                            Text("6").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Help & Timer indicators").foregroundColor(Color.white)
                                .onTapGesture {
                                    
                                    if self.startTalking {
                                        
                                    gameSynthSpeechFemale(word: "The timer will count down from 3 mins. your score will also be displayed in the green square")
                                    }
                            }
                            
                            //Create space to align
                            Spacer().frame(width:109)
                            
                            Image("Help_Timer_Score")
                                .resizable()
                                .frame(width:30,height: 75)
                            
                                .onTapGesture {
                                    
                                    withAnimation {
                                        self.toggleImageSix.toggle()
                                        
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
                                    
                                    if self.toggleImageFour {
                                        
                                        withAnimation {
                                        
                                            self.toggleImageFour.toggle()
                                        }
                                    }
                                    
                                //Check status of ToggleFive
                                if self.toggleImageFive {
                                    
                                    withAnimation {
                                    
                                        self.toggleImageFive.toggle()
                                    }
                                }
                                    
                                    
                                
                            }
                            
                            
                        }.transition(.move(edge: .leading))//End of HStack gude four
                        
                        
                        }//End on instruction Five
                        
                        
                    
                        
                    }//Vstack for the guide
                    
                    if self.toggleImageOne {
                        
                        
                        ImageSize(userImage: "Help_MainPageMap").transition(.move(edge: .leading))
                            
                        
                    }
                    
                    if self.toggleImageTwo {
                    
                        
                        ImageSize(userImage: "Help_Map").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageThree {
                        
                        ImageSize(userImage: "Help_Tiles").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageFour {
                        
                        ImageSize(userImage: "Help_PlayButton").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageFive {
                        
                        ImageSize(userImage: "Help_WordPlayed").transition(.move(edge: .leading))
                    }
                    
                    if self.toggleImageSix {
                        
                        ImageSize(userImage: "Help_Timer_Score").transition(.move(edge: .leading))
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
