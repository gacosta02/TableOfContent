//
//  CardView.swift
//  TableOfContent
//
//  Created by Gabriel Eduardo Acosta  on 7/4/20.
//  Copyright © 2020 Gabriel Eduardo Acosta . All rights reserved.
//

import SwiftUI

struct CardView: View {
    //MARK:- PROPIETIES
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    var card: Card
    
    @State private var fadeIn: Bool = false
    @State private var moveDonwward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    //Mark: - CARD
    var body: some View {
        
        ZStack{
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
        VStack{
            Text(card.tittle)
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Text(card.headline)
                .fontWeight(.light)
                .foregroundColor(Color.white)
            .italic()
        }
        .offset(y: moveDonwward ? -218 :330)
            
            Button(action: {
                print("Button was tapped.")
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }){
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                    
                }
                .padding(.vertical)
                .padding(.horizontal,24)
            .background(LinearGradient(gradient:
                Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                    .shadow(color: Color("ColorShdow"),radius:
                        6, x:0, y:3)
            }
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors:
            card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
            .onAppear(){
                withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
        }
                withAnimation(.linear(duration: 0.8)){
                    self.moveDonwward.toggle()
                    self.moveUpward.toggle()
                }
    }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(card.tittle),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            
            )
}
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[2])
            .previewLayout(.sizeThatFits)
    }
}
}
