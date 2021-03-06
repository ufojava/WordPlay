//
//  GameDictionary.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 04/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Struct to list dictionary
import SwiftUI



struct GameDictionary: View {
    
    var body: some View {
        
        
        //NavigationView {//Temp Navigation View
        
        GameDicList()
   // }
}
}



//Dictionary Previews
struct GameDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GameDictionary()
        
    }
    
}



struct GameDicList: View {
    
    @ObservedObject var fourLetterWords = DataLoader()
    
    //Alphabet List
    @State private var alphabetList = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    //Alphabets selected
    @State private var selectedAlphabet = 0
    
    @State private var getList = false
   
    
   
    
    
    
    //Function to check array
    func letterSearch(inLetter:String) -> some View {
        
        
    //Perform filter of array
        let srchRecord = fourLetterWords.dataStructure.filter {$0.word.hasPrefix(inLetter)}

            
        return List {
        
        
        ForEach(srchRecord,id: \.id) { word in
            
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("\(word.word)").foregroundColor(Color.white)
                            
                            
                        .frame(width:380,height:30)
                        .background(Color.init(red: 0.5, green: 0.3, blue: 0.1))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                    
                              
                    }.padding(.horizontal,40)
                    
                }
          
        }//End of List
    }
        
    
    
     var body: some View {
        
       
        
        VStack {
            
            
            
            
            ZStack(alignment: .top) {
                
            
                
                Image("4LettersOtherScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
            
                            Text("4 Letter Dictionary")
                                .frame(width:380,height:30)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                            
                                .onAppear() {
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    gameSynthSpeechFemale(word: "Welcome to the 4 letter dictionary. Select a letter and click get list")
                                }
                            }
                
            Spacer().frame(height:20)
            
                            Picker(selection: $selectedAlphabet, label: Text("")) {
                                
                                ForEach(0..<alphabetList.count) {
                                    
                                    Text(self.alphabetList[$0])
                                        .foregroundColor(Color.yellow)
                                
                                       
                                }
                                
                                
                                
                              
                            }
                            .frame(width:200)
                            .clipped()
                            .border(Color.green)
                            .padding()
            
           
             
            
            Spacer().frame(height:20)
            
            Button(action: {
                
                self.getList = true
             
                
                gameSynthSpeechFemale(word: self.alphabetList[self.selectedAlphabet].lowercased())
                
            }) {
                
                
                
                Text("Get List")
                    .frame(width:90,height:30)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                
                
            }
            
             Spacer()
            
          
            
            if getList {
                
                letterSearch(inLetter: alphabetList[selectedAlphabet])
                
                
            }
                }
            }
        }
    }
}

