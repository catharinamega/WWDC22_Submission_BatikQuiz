//
//  File.swift
//  BatikQuiz_SSC2022
//
//  Created by Catharina Adinda Mega Cahyani on 19/04/22.
//
import SwiftUI
import Foundation

struct Quiz1 : View {
    @Environment(\.colorScheme) var colorScheme
    //number of question
    @State var i : Int = 0
     
    // State if the value changes it will re-render
    @State var score = 0
    @State private var showActionSheet = false
     
    
    @State var selected: String = ""
    
//    State variables that will be used for adaptive orientation
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @State public var device = UIDevice.current.userInterfaceIdiom
    
    
//build the whole quiz view appeareance
    var body: some View {
//       if looping, so the quiz view only appear as many as the count of the question
        if(self.i < myQuiz1.count){
//            if looping in order to change the current orientation otherwisely
            if orientation == .portrait || orientation == .portraitUpsideDown{
//                use 3:1 scale
//                device == .pad ? 45: 15
                VStack(spacing: device == .pad ? 45: 15){
                    //if i < of questions --> play question
                     setContent()
                     
                }
        //            .padding(.horizontal)
                .padding(.leading, device == .pad ? 60: 20)
                    .padding(.trailing, device == .pad ? 60: 20)
                    .padding(.top, device == .pad ? 60: 20)
                    .padding(.bottom, device == .pad ? 60: 20)
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        orientation = UIDevice.current.orientation
                    }
            }
            else{
                HStack(spacing: device == .pad ? 45: 15){
                    //if i < of questions --> play question
                     setContent()
                     
                }
//                keep the horizontal same for pad
        //            .padding(.horizontal)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        orientation = UIDevice.current.orientation
                    }
            }
            
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItem(placement: .principal){
//                    VStack{
////                        Text("Title")
////                            .font(.headline)
//
//
//                    }
//                }
//            }
            
            
        }else{ //after last question --> show final view with score
            FinalView(score : self.score)
        }
        
    }
    
    
//    setContent function to separate the image, ref, and description because it will appear different from button
    func setContent() -> some View {
        return Group{
        
            VStack(spacing: device == .pad ? 45: 15){
                    //image of the question
                    Image(myQuiz1[self.i].img)
                        .resizable()
            //                    .scaledToFit()
            //                    .fixedSize()
                
                
                        .scaledToFit()
                        .frame(height: orientation.isLandscape ? UIScreen.main.bounds.width/5 : UIScreen.main.bounds.height/5)
            //                    .padding(.horizontal)
                    
            //                reference
                    Text("Reference: \(myQuiz1[self.i].ref)")

                        .font(.system(size: 12, weight: .light, design: .default))
                     
                    //text of the question
            //                Text(myQuiz1[self.i].text)
            //                .multilineTextAlignment(.leading)
            ////
            ////                .padding(.vertical)
            //                .fixedSize(horizontal: false, vertical: true)
                    
                
            //            using textView for description of the batik
                TextView(){
                    $0.text = myQuiz1[self.i].text
                    $0.isEditable = false
//            device == .pad ? 75: 15
                    $0.font = UIFont.systemFont(ofSize: device == .pad ? 30: 15, weight: .medium)
                }
            }
            
//          device == .pad ? 30: 10
            VStack(spacing: device == .pad ? 30: 10){
//                looping for button as many as the count of answer from the myQuiz1
                ForEach(myQuiz1[i].answer,id:\.self){answer in
                
                    Button(action:{
        //                            self.showActionSheet = true
                        print(answer, myQuiz1[i].correct)
                        self.selected = answer
                            self.buttonAction(n: answer)
                            },
                           label: {
                            Text(answer)
                            .font(.system(size: device == .pad ? 45: 15, weight: .medium, design: .default))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
//                                    ternary if, the correct answer always show in green either user choose it or not, but if user's answer is wrong, then the answered one turns into red
                                        .stroke(selected == "" ? Color.blue
                                                : answer == myQuiz1[i].correct ? Color.green
                                                : selected == answer ? Color.red : Color.blue )
                                )
                        
                        })
        //                    button can be clicked or not
                    .allowsHitTesting(selected == "" ? true : false)
                    
                    
                }
            }

            
        }

    
    }
     
    //action of the buttons
    func buttonAction( n : String){
        //if user answer is correct then increase the score
        if(myQuiz1[self.i].correct == n){
            self.score = self.score + 1
        }
        //after that show the next question
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            selected = ""
            self.i = self.i + 1
                    }

         
    }
     
     
}
 
struct Quiz1_reviews: PreviewProvider {
    static var previews: some View {
        Quiz1()
    }
}
