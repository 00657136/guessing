//
//  ChartView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/4/14.
//

import SwiftUI

struct ChartView: View {
    
    @State var progressValue: Float = 0.0
    @State var score : Int
    @State private var show = false
    @State private var comments = [
        "看來你已經掌握好"
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btn_Back : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
            HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "chevron.backward")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                    Text("上一頁")
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
                                    
                                    timer.invalidate()
                                    show = true
                                }
                            }
                            
                        }
                
                    
                    
                    if show {
                        if score == 10{
                            
                        }
                        VStack{
                            
                            StrokeText(text: comments[0], width: 1, color: .black)
                                .font(.system(size: 30,weight:.bold))
                                .foregroundColor(Color.white)
                            
                            StrokeText(text: comments[0], width: 1, color: .black)
                                .font(.system(size: 20,weight:.bold))
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
