//
//  HomeView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/3/31.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                
                Image("海邊")
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    
                
                Color( red: 1, green: 1, blue: 1, opacity: 0.5)
                
                VStack{
                    Spacer()
                    Color( red: 139/255, green: 143/255, blue: 105/255, opacity: 0.7)
                        .frame(width:UIScreen.main.bounds.width*3/4,height: UIScreen.main.bounds.height/2)
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 30){
                    
                    Spacer()
                    
                    Text("撩 妹 燈 謎")
                        .font(.system(size: 20,weight:.bold))
                        .foregroundColor(.init(red: 139/255, green: 143/255, blue: 105/255))
                        .frame(width:UIScreen.main.bounds.width/4)
                        .padding()
                        .background(Color(.white))
                    
                    Color( red: 1, green: 1, blue: 1)
                        .frame(width:UIScreen.main.bounds.width/2,height: 1)
                    
                    VStack(spacing:10){
                        HStack(spacing:0){
                            Text("10個幫助")
                                .font(.system(size: 40,weight:.regular))
                                .foregroundColor(.white)
                            Text("直男")
                                .font(.system(size: 40,weight:.black))
                                .foregroundColor(.yellow)
                            Text("的")
                                .font(.system(size: 40,weight:.regular))
                                .foregroundColor(.white)
                        }
                        Text("創意撩妹語錄")
                            .font(.system(size: 38,weight:.semibold))
                            .foregroundColor(.white)
                    }
                    
                    Color( red: 1, green: 1, blue: 1)
                        .frame(width:UIScreen.main.bounds.width/2,height: 1)
                    
                    NavigationLink(destination: ContentView()){
                        Text("- 點 擊 進 入 -")
                            .font(.system(size: 20,weight:.bold))
                            .foregroundColor(.white)
                    }
                        
                    
                    Spacer()
                    
                    
                    
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
