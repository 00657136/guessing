//
//  ChartView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/4/14.
//

import SwiftUI

struct ChartView: View {
    
    @State var progressValue: Float = 0.3
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                    
                LinearGradient(gradient: Gradient(colors: [Color.init( red: 253/255, green: 208/255, blue: 201/255), Color.white]), startPoint: .top, endPoint: .bottom)
                
                Color( red: 1, green: 1, blue: 1, opacity: 0.5)
                
                VStack {
                    Spacer()
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                
                    Spacer()
                    
                    Button(action: {
                    self.incrementProgress()
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill")
                        Text("Increment")
                    }
                    .padding(15.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                    
                Spacer()
            }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    func incrementProgress() {
            let randomValue = Float([0.1, 0.2, 0.3].randomElement()!)
            self.progressValue += randomValue
        }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
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
                .animation(.linear)
            
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
