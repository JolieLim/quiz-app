//
//  Score View.swift
//  Quiz App
//
//  Created by Jolie Lim on 15/6/22.
//

import SwiftUI

struct Score_View: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            CircularProgressView(progress: CGFloat(score))
                .frame(width: 150, height: 150)
            Text("You got")
            Text("\(score)/\(totalQuestions)")
        }
    }
}

struct Score_View_Previews: PreviewProvider {
    static var previews: some View {
        Score_View(score: 4, totalQuestions: 4)
    }
}
