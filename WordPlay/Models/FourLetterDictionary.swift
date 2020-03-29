//
//  FourLetterDictionary.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 28/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Four Letter Dictionary
import Foundation
import SwiftUI

struct FourLetterDictionary: Codable {
    
    public var id: Int
    
    var word: String
    
    
    
}


class Letter: ObservableObject {
    
    @Published var word = ""
    
}
