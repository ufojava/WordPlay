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
    
    
    
    
    var body: some View {
        
        VStack {
    
            ZStack {
                
                
                //Background Image
                Image("4LettersOtherScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                    .onAppear() {
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                        
                        self.showIsntructionOne = true
                            
                        }
                        
                        }
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                            
                            self.showIsntructionTwo = true
                                
                            }
                        
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            withAnimation {
                            
                            self.showIsntructionThree = true
                                
                            }
                        
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                            withAnimation {
                            
                            self.showIsntructionFour = true
                                
                            }
                        
                        }
                        
                        
                        
                }
                
                VStack {
                    
                    Text("Click on image to enlarge").foregroundColor(Color.white).font(.system(size: 15))
                    
                    VStack(alignment: .leading) {
                        
                        
                        if self.showIsntructionOne {
                    
                            HStack {//Help One
                                
                                
                        
                                Text("1").foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                                
                                Text("Select play game to begin").foregroundColor(Color.white)
                                
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
                                                self.toggleImageTwo.toggle()
                                            }
                                            
                                            //Check status of ToggleThree
                                            if self.toggleImageThree {
                                                
                                                self.toggleImageThree.toggle()
                                            }
                                            
                                            //Check status of ToggleFour
                                            if self.toggleImageFour {
                                                
                                                self.toggleImageFour.toggle()
                                            }
                                               
                                               
                                    }
                                    
                                
                                }.transition(.move(edge: .leading))//End Guide One
                        
                        
                        }//End of Instruction One
                        
                        
                        
                        if self.showIsntructionTwo {
                        
                        HStack {//Help Two
                            
                            Text("2").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Form a word from the colored").foregroundColor(Color.white)
                            
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
                                            
                                            self.toggleImageOne.toggle()
                                        }
                                        
                                        //Check status of ToggleThree
                                        if self.toggleImageThree {
                                            
                                            self.toggleImageThree.toggle()
                                        }
                                        
                                        //Check status of ToggleFour
                                        if self.toggleImageFour {
                                            
                                            self.toggleImageFour.toggle()
                                        }
                                           
                                           
                                }//End of guide two
                            
                        }.transition(.move(edge: .leading))
                        
                        }//End on Instruction Two
                        
                        
                        if self.showIsntructionThree {
                        
                        HStack {
                            
                            Text("3").foregroundColor(Color.white)
                                .frame(width: 40, height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Previous words stored").foregroundColor(Color.white)
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
                                        
                                        self.toggleImageOne.toggle()
                                    }
                                    
                                    //Check status of ToggleTwo
                                    if self.toggleImageTwo {
                                        
                                        self.toggleImageTwo.toggle()
                                    }
                                    
                                    //Check status of ToggleFour
                                    if self.toggleImageFour {
                                        
                                        self.toggleImageFour.toggle()
                                    }
                                    
                            }
                                
                            
                            
                        }.transition(.move(edge: .leading))//End HStack for guide three
                            
                        }//End of Instruction three
                        
                        
                        if self.showIsntructionFour {
                        
                        HStack {
                            
                            Text("4").foregroundColor(Color.white)
                                .frame(width:40,height: 40)
                                .background(Color.init(red: 0.2, green: 0.6, blue: 0.4))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black,lineWidth: 1))
                            
                            Text("Memorised Word").foregroundColor(Color.white)
                            
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
                                        
                                        self.toggleImageOne.toggle()
                                    }
                                    
                                    //Check Status Two
                                    if self.toggleImageTwo {
                                        
                                        self.toggleImageTwo.toggle()
                                    }
                                    
                                    //Check Status three
                                    if self.toggleImageThree {
                                        
                                        self.toggleImageThree.toggle()
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
            .frame(width:160,height: 320)
            .scaledToFill()
        
    }
}
