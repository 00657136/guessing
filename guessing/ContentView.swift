//
//  ContentView.swift
//  guessing
//
//  Created by 張凱翔 on 2021/3/9.
//

import SwiftUI


struct ContentView: View {
    @State private var expand = false
    @State private var Qindex = 0
    @State private var score = 0
    @State private var ansLock = false
    @State private var incorrect = ""
    @State private var selectSection = ""
    @State private var showAlert = false
    @State private var QuestionArr =
    [ question(content: "最美的龍是你的笑容，那最美的路呢？",
               options: ["我們的路","阿依稀爹路(日文：愛してる)","高速公路"].shuffled(),
               answer: "阿依稀爹路(日文：愛してる)"),
      question(content: "我是一位婚禮主持人，但我無法主持你的婚禮，為什麼？",
               options: ["我已經先主持別場婚禮","我肚子痛","我是你的新郎"].shuffled(),
               answer: "我是你的新郎"),
      question(content: "如果你是太陽，那我會是什麼？",
               options: ["月亮，因為我們無法相見","冰淇淋，因為我會被你融化","雨傘，因為我會毫無用處"].shuffled(),
               answer: "冰淇淋，因為我會被你融化"),
      question(content: "你知道我最喜歡喝什麼嗎？",
               options: ["我最喜歡呵護你","我最喜歡喝可樂","我最喜歡喝咖啡"].shuffled(),
               answer: "我最喜歡呵護你"),
      question(content: "你知道為什麼我最近該減肥了嗎？",
               options: ["因為你在我心裡的份量很重","因為我太常喝手搖杯","因為我經常吃炸物"].shuffled(),
               answer: "因為你在我心裡的份量很重"),
      question(content: "沒有水的地方叫沙漠，那沒有妳的地方叫什麼？",
               options: ["寂寞","泡沫","石墨"].shuffled(),
               answer: "寂寞"),
      question(content: "妳知道為什麼我最近都不想追劇了嗎？",
               options: ["因為我只想追妳","因為最近沒有好看的劇","因為我沒時間"].shuffled(),
               answer: "因為我只想追妳"),
      question(content: "妳知道為什麼我的眼睛那麼漂亮嗎？",
               options: ["因為我眼中只有妳","因為我長得好看","因為我去整容"].shuffled(),
               answer: "因為我眼中只有妳"),
      question(content: "猜猜我是什麼星座？",
               options: ["為你量身定做","博愛座","成名作"].shuffled(),
               answer: "為你量身定做"),
      question(content: "木頭做的門叫木門，那幸福做的門叫什麼？",
               options: ["我們","旋轉門","幸福門"].shuffled(),
               answer: "我們"),

      
    ].shuffled()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btn_Back : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
            HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "chevron.backward")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                    Text("回首頁")
                        .foregroundColor(.white)
                        
            }
            .frame(width:UIScreen.main.bounds.width/5)
            .background(Color(red: 139/255, green: 143/255, blue: 105/255,opacity: 0.7))
            .cornerRadius(20)
            }
        }
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                    
                LinearGradient(gradient: Gradient(colors: [Color.init( red: 253/255, green: 208/255, blue: 201/255), Color.white]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading, spacing: 40){
                    
                    Spacer()
                    
                    Image("\(Qindex+1)")
                        .resizable()
                        .scaledToFit()
    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Color( red: 1, green: 1, blue: 1, opacity: 0.5)

                
                
                
                VStack(alignment: .leading, spacing: 30){
                    
                    Spacer()
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                        Spacer()
                        
                        StrokeText(text: "\(score) / \(Qindex+1)", width: 1, color: .black)
                            .font(.system(size: 25,weight:.bold))
                            .foregroundColor(Color.white)
                        
                            
                        
                    }
                    
                    
                    
                    StrokeText(text: "問題\(Qindex+1):", width: 1, color: .black)
                        .font(.system(size: 40,weight:.bold))
                        .foregroundColor(Color.white)
                        
                        
                        
                    StrokeText(text: QuestionArr[Qindex].content, width: 1, color: .black)
                        .font(.system(size: 35,weight:.bold))
                        .foregroundColor(Color.white)
                    
                       
                    
                    
                    Spacer()
                    
                //.......選項
                    
                    VStack(alignment: .leading, spacing: 20){
                     //......A選項
                        OptionView(showAlert: $showAlert, ansLock: $ansLock, incorrect: $incorrect, score: $score, options: $QuestionArr[Qindex].options[0], answer: $QuestionArr[Qindex].answer, selectSection: $selectSection, section: "A.")
                            .onTapGesture {
                                if ansLock == false {
                                    ansLock = true
                                    selectSection = "A."
                                    if QuestionArr[Qindex].options[0] == QuestionArr[Qindex].answer{
                                        score += 1
                                    }
                                    else {
                                        incorrect = "A."
                                    }
                                    
                                }
                                else {
                                    showAlert = true
                                }
                            }
                    //......B選項
                        OptionView(showAlert: $showAlert, ansLock: $ansLock, incorrect: $incorrect, score: $score, options: $QuestionArr[Qindex].options[1], answer: $QuestionArr[Qindex].answer, selectSection: $selectSection, section: "B.")
                            .onTapGesture {
                                if ansLock == false {
                                    ansLock = true
                                    selectSection = "B."
                                    if QuestionArr[Qindex].options[1] == QuestionArr[Qindex].answer{
                                        score += 1
                                    }
                                    else {
                                        incorrect = "B."
                                    }
                                    
                                }
                                else {
                                    showAlert = true
                                }
                            }
                    //......C選項
                        OptionView(showAlert: $showAlert, ansLock: $ansLock, incorrect: $incorrect, score: $score, options: $QuestionArr[Qindex].options[2], answer: $QuestionArr[Qindex].answer, selectSection: $selectSection, section: "C.")
                            .onTapGesture {
                                if ansLock == false {
                                    ansLock = true
                                    selectSection = "C."
                                    if QuestionArr[Qindex].options[2] == QuestionArr[Qindex].answer{
                                        score += 1
                                    }
                                    else {
                                        incorrect = "C."
                                    }
                                    
                                }
                                else {
                                    showAlert = true
                                }
                            }
                    }
                    
                    
                    Spacer()
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                        Spacer()
                        if Qindex+1 < QuestionArr.count{
                            Text("下一題")
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                        }
                        else{
                            Text("結束")
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                        }
                        Spacer()
            
                    }
                    .padding()
                    .background(Color(red: 184/255, green: 222/255, blue: 241/255))
                    .cornerRadius(20)
                    .onTapGesture {
                        if Qindex+1 < QuestionArr.count{
                            Qindex += 1
                            ansLock = false
                            incorrect = ""
                            selectSection = ""
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                }.padding()
            
            }
    //        .background(Color(.black))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btn_Back)
    }
    
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
 
struct question {
    var content : String
    var options : [String]
    var answer : String
}


struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

struct OptionView: View {
    @Binding var showAlert : Bool
    @Binding var ansLock : Bool
    @Binding var incorrect : String
    @Binding var score : Int
    @Binding var options : String
    @Binding var answer : String
    @Binding var selectSection : String
    @State var section : String
    
    var body: some View {
        ZStack(alignment: .leading){
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                Spacer()
                Text(section)
                    .font(.system(size: 25))
                    .foregroundColor(Color.black)
                Text(options)
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                Spacer()
                
            }
            .padding()
            .background(Color(red: 234/255, green: 207/255, blue: 216/255))
            .cornerRadius(20)
            .alert(isPresented: $showAlert){ () -> Alert in
                return Alert(title: Text("你已經回答過了！不可以再回答"))
            }
            
            if selectSection == section{
                HStack(alignment: .center){
                    Spacer()
                    Text(section)
                        .font(.system(size: 25))
                        .foregroundColor(Color.black)
                    Text(options)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                    Spacer()
                    
                }
                .padding()
                .background(Color(red: 199/255, green: 196/255, blue: 212/255))
                .cornerRadius(20)
                
            }
            
            if ansLock == true && options == answer{
                
                Image("tick")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30,height: 30)
                    .padding()
            }
            
            else if incorrect == section{
                
                Image("wrong")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30,height: 30)
                    .padding()
            }
            
            
        }
    }
}
