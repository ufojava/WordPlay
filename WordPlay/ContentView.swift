//
//  ContentView.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 28/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        
        
        
        NavigationView {
        
                        ZStack {
                            
                            Image("4LettersFrontScreen")
                                .resizable()
                            
                                .scaledToFill()
                            
                                .edgesIgnoringSafeArea(.all)
                                
                                
                        
                        VStack {
                        
                        Text("Hello, World!")
                        
                            //fourLetter()
                            
                            
                        }
            }
        
        .navigationBarTitle(Text("Home 🏚"))
        
        }
        
}

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
