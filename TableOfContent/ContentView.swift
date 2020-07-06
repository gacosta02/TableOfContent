//
//  ContentView.swift
//  TableOfContent
//
//  Created by Gabriel Eduardo Acosta  on 7/4/20.
//  Copyright © 2020 Gabriel Eduardo Acosta . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //MARK: -Properties
    var cards: [Card] = cardData
    
    
    //Mark: - content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                   
                }
        }
        .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
        .previewDevice("Iphone 11 pro")
    }
}
