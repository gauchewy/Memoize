//
//  ContentView.swift
//  Memoize
//
//  Created by Qiwei on 4/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardRowView()
            CardRowView()
            CardRowView()
            CardRowView()
        }
        .padding()
        .foregroundColor(.green)
    }
}

struct CardRowView: View {
    let emojis = ["🥺","🙃", "🥵", "🫡", "🤪"]
    
    var body: some View {
        HStack{
            //use each emoji as a unique identifier to get num of cards
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill(.white)
                shape.stroke(lineWidth:3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill(.green)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
