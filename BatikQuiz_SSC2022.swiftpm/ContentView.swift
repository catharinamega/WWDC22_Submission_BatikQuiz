import SwiftUI

struct ContentView: View {
     
    //var for the score
    @State var score = 0
    //    State variables that will be used for adaptive orientation
        @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
        @State public var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
        NavigationView{

//            device == .pad ? 80: 50
            VStack(spacing: device == .pad ? 60: 50){
                 
//                change to own description
                Text("Batik Quiz")
              //            device == .pad ? 80: 40
                    .font(.system(size: device == .pad ? 60: 40, weight: .bold, design: .rounded))
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: orientation.isLandscape ? UIScreen.main.bounds.width/5 : UIScreen.main.bounds.height/5)
                
                Text("Proud to wear batik \nProud to learn batik")
                //            device == .pad ? 60: 20
                    .font(.system(size: device == .pad ? 30: 20, weight: .medium, design: .rounded))
                
                
                //kind of anchor href (in webdev) to start the quiz
                NavigationLink(destination: Quiz1()) {
                    Text("Start the Quiz")
                        .font(.system(size: device == .pad ? 30: 20, weight: .semibold, design: .rounded))
                }
                HStack{
                    //display your score
                    Text("Last Score : \(self.score) / \(myQuiz1.count)")
                        .onAppear(){ //refresh score
                            self.score = LoadScore(quiz: "myQuiz1")
                            
                    }
                        .font(.system(size: device == .pad ? 30: 20, weight: .medium, design: .rounded))
                    
                }
//                  //            device == .pad ? 80: 50
                .padding(.bottom, device == .pad ? 60: 50)
    
                Text("Each question contains Text View\n Scroll if the description is too long")
//                  //            device == .pad ? 36: 12
                    .font(.system(size: device == .pad ? 24: 12, weight: .light, design: .default))
                    .foregroundColor(Color.gray)
            }
            .navigationBarTitle("Batik Quiz",displayMode: .inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
