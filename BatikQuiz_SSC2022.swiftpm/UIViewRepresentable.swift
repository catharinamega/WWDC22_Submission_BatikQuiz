//
//  File.swift
//  BatikQuiz_SSC2022
//
//  Created by Catharina Adinda Mega Cahyani on 23/04/22.
//
import SwiftUI
//import Foundation

//UIViewRepresentable is used because there is UITextView (UIKit) that needs to be converted to Swift UI
struct TextView: UIViewRepresentable{
    typealias UIViewType = UITextView
    var config = {
        (view: UIViewType) in
        
    }
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
            UIViewType()
    }
        
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
            config(uiView)
    }
}
