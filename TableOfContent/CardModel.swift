//
//  CardModel.swift
//  TableOfContent
//
//  Created by Gabriel Eduardo Acosta  on 7/5/20.
//  Copyright © 2020 Gabriel Eduardo Acosta . All rights reserved.
//

//import Foundation
import SwiftUI

//MARK:- CARD MODEL

struct Card: Identifiable {
    var id = UUID()
    var tittle: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
    
}
