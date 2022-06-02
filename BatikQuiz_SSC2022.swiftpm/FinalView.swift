//
//  File.swift
//  BatikQuiz_SSC2022
//
//  Created by Catharina Adinda Mega Cahyani on 19/04/22.
//

import Foundation
import SwiftUI
 
//build an object FinalView with data type is View
struct FinalView : View {
    var score : Int
    var body: some View {
//        use vertical stack view because because each component must be lined down
        VStack(spacing: 20){
            Text("Final Score : \(score)")
//          action so the saved score can appear
            .onAppear(){
//              call the saveScore function from QuizModel
                SaveScore(quiz: "myQuiz1", score: self.score)
            }
            
            Image("final_memoji")
                .resizable()
                .scaledToFit()
            
            Text("You Finish!\n There are still many batik's motifs in Indonesia, but learn 10 of them is already a good start")
//                .frame( alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                
            
        }
    }
}

// PreviewProvider as protocol type that produces view previews in Xcode
struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(score: 1)
    }
}
