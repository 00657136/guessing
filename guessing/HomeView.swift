//
//  HomeView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/3/31.
//

import SwiftUI

struct HomeView: View {
    
    @State private var columns = [
                    GridItem(),
                    GridItem(),
                    GridItem()
                ]
    
    @State private var GridImageArray = [
                    "",
                    "4",
                    "5",
                    "6",
                    "7",
                    "",
                    "",
                    "8",
                    "9",
                    
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Image("pink")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height)
                    .clipped()
                
                Color( red: 1, green: 1, blue: 1, opacity: 0.5)
                
                VStack(alignment: .center, spacing: 30){
                    
                    Spacer()
                    
                    StrokeText(text: "我是字", width: 1, color: .black)
                        .font(.system(size: 60,weight:.bold))
                        .foregroundColor(Color.white)
                    Spacer()
                    
                    LazyVGrid(columns: columns) {
                        ForEach(GridImageArray.indices) { (index) in
                            
                            NavigationLink(
                                destination: ContentView()){//view的到時候要放array
                                Image(GridImageArray[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                    .clipped()
                            
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                
            }
//            .background(Color(.black))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
