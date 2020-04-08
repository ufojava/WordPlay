//
//  ColourPallette.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 08/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


struct TestColor: View {
    
    var body: some View {
        
        //Text("Place Holder")
        Rectangle()
            .frame(width:80,height: 40)
            .foregroundColor(Color.init(red: 0.5, green: 0.3, blue: 0.1))
        
        
        
    }
    
}

struct TestColorPreviews: PreviewProvider {
    
    static var previews: some View {
        
        TestColor()
    }
}
