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
        
        
        NavigationView {//Temp Navigation View
        
        GameDicList()
    }
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
    
    //Perform filter of array
    
    
    
    //Function to check array
    func letterSearch(inLetter:String) -> some View {
        
        
        
   
        
    //Perform filter of array
        let srchRecord = fourLetterWords.dataStructure.filter {$0.word.hasPrefix(inLetter)}
      /*
        if srchRecord.indices.contains(0) {
            
            print("Record Found")
            print(srchRecord[0])
 
 */
            
    return        List(srchRecord,id: \.id) { word in
                
                Text("\(word.word)")
            }
            
        }
        
        
        
//return Text("Hello")
        
        
    
    
    
    
    
     var body: some View {
        
        
        VStack {
            
            
            Text("Select Letter")
            
            Picker(selection: $selectedAlphabet, label: Text("")) {
                
                ForEach(0..<alphabetList.count) {
                    
                    Text(self.alphabetList[$0])
                }
                
              
            }
                .frame(width:200)
                .clipped()
                .border(Color.green)
                .padding()
             
            
        Text("Selected Letter \(alphabetList[selectedAlphabet])")
            
            Spacer()
            
            Button(action: {
                
                self.getList = true
                
            }) {
                
                
                
                Text("Get List")
                
                
            }
            
            if getList {
                
                letterSearch(inLetter: alphabetList[selectedAlphabet])
                Spacer()
                
            }
           
          
        }
    }
}

