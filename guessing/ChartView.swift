//
//  ChartView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/4/14.
//

import SwiftUI
import AVFoundation

struct ChartView: View {
    
    var failurePlayer : AVPlayer{ AVPlayer.failurePlayer}
    var fairPlayer : AVPlayer{ AVPlayer.fairPlayer}
    var winPlayer : AVPlayer{ AVPlayer.winPlayer}
    
    @State var progressValue: Float = 0.0
    @State var score : Int
    @State private var index = 0
    @State private var show = false
    @State private var commentsArr = [
        comments(title: "臭直男", content: "你這個大木頭需要重新再回答一次"),
        comments(title: "還算浪漫", content: "你已經懂得一點情調，建議你重新回答一次"),
        comments(title: "情場高手", content: "恭喜你獲得浪漫因子，挑幾個喜歡的句子去實戰吧！"),
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btn_Back : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()}) {
                HStack(alignment: .center, spacing: 0) {
                        Image(systemName: "chevron.backward")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        Text("回測驗")
                            .foregroundColor(.white)
                                
                }
                .frame(width:UIScreen.main.bounds.width/5)
                .background(Color(red: 139/255, green: 143/255, blue: 105/255,opacity: 0.7))
                .cornerRadius(20)
            }
    }
    
    var body: some View {
        
            ZStack(alignment: .top){
                    
                LinearGradient(gradient: Gradient(colors: [Color.init( red: 253/255, green: 208/255, blue: 201/255), Color.white]), startPoint: .top, endPoint: .bottom)
                
                Color( red: 1, green: 1, blue: 1, opacity: 0.5)
                
                VStack(alignment: .center, spacing: 20) {
                    Spacer()
                    
                    
                    ProgressBar(progress: $progressValue)
                        .frame(width: 150.0, height: 150.0)
                        .padding(40.0)
                        .onAppear(){
                            
                            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){timer in
                                progressValue += Float(score)/1000.0
                                if progressValue >= Float(score)/10.0{
                                    
                                    if score > 7{
                                        winPlayer.playFromStart()
                                        index = 2
                                    }
                                    else if score > 4{
                                        fairPlayer.playFromStart()
                                        index = 1
                                    }
                                    else {
                                        failurePlayer.playFromStart()
                                        index = 0
                                    }
                                    
                                    timer.invalidate()
                                    show = true
                                }
                            }
                            
                        }
                
                    
                    
                    if show {
                            
                        VStack{
                            
                            StrokeText(text: commentsArr[index].title, width: 1, color: .black)
                                .font(.system(size: 40,weight:.bold))
                                .foregroundColor(Color.white)
                            
                            StrokeText(text: commentsArr[index].content, width: 1, color: .black)
                                .font(.system(size: 30,weight:.bold))
                                .foregroundColor(Color.white)
                                
                        }
                        .frame(width:UIScreen.main.bounds.width*4/5,height: UIScreen.main.bounds.height/3)
                    }
                    else{
                        Color(.white)
                            .opacity(1)
                            .frame(width:UIScreen.main.bounds.width*4/5,height: UIScreen.main.bounds.height/3)
                            .hidden()
                    }
                    
                    Spacer()
                }
                
                
                
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btn_Back)
        
            
        
    }

    
    
    
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(score: 0)
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: UIScreen.main.bounds.width*2/3, height: UIScreen.main.bounds.width*2/3)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 50.0))
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(red: 250/255, green: 81/255, blue: 55/255), Color.init(red: 220/255, green: 42/255, blue: 118/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .frame(width: UIScreen.main.bounds.width*2/3, height: UIScreen.main.bounds.width*2/3)
                .shadow(radius: 20 )
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeOut)
            
            Circle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width*2/5, height: UIScreen.main.bounds.width*2/5)
                .shadow(radius: 20 )
            
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.system(size: 40,weight:.medium))
                .foregroundColor(.gray)
        }
    }
}

struct comments {
    var title : String
    var content : String
}
