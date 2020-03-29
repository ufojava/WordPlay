//
//  DataLoader.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 28/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation

/*

 This calse is responsible for decoding the JSON file
 
 */


public class DataLoader: ObservableObject {
    
    @Published var dataStructure = [FourLetterDictionary]()
    
    init() {
        
        //Decode file
        decodeJSONFIle()
        
        
        
    }
    
    //Function to decode JSON FIle
    func decodeJSONFIle() {
        
        //File URL using If Let to prevent crashes if the file does not exist
        
        if let fileLocaiton = Bundle.main.url(forResource: "4LetterDictionary", withExtension: "json") {
            
            
            //Do try catch
            
            
            
            do {
                
                
                //Define Data
                let data = try Data(contentsOf: fileLocaiton)
                
                
                //Define Decoder
                
                let jsonDecoder = JSONDecoder()
                
                
                //Decode the JSON Data
                let dataFromJSON = try jsonDecoder.decode([FourLetterDictionary].self, from: data)
                
                
                //Allow Data to load
                DispatchQueue.main.async {
                    self.dataStructure = dataFromJSON
                    
                }//End of Async
                
                
            } catch {
                
                print(error)
                
            }
            
            
            
            
            
            
        }//End of file location
        
        
        
        
        
        
        
    }//End of Function
    
    
    
    
}//End Class
