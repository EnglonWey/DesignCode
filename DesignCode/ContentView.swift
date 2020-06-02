//
//  ContentView.swift
//  DesignCode
//
//  Created by 英伦 on 2020/6/1.
//  Copyright © 2020 英伦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TitleView()
                .blur(radius: 20)//模糊
            
            BackCardView()//偏移
                .background(Color("card4"))//背景颜色
                .cornerRadius(20)//圆角
                .shadow(radius: 20)//阴影
                .offset(x:0,y:-40)//偏移
                .scaleEffect(0.9)//缩进？
                .rotationEffect(.degrees(10))//旋转 angle:角度
                .rotation3DEffect(Angle(degrees: 10), axis: (x:10.0,y:0,z:0))//3D旋转
                .blendMode(.hardLight)//.hardLight 高光
            
            BackCardView()//偏移
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:-20)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x:10.0,y:0,z:0))
                .blendMode(.hardLight)
            
            CardView()//卡片整合代码
                .blendMode(.hardLight)
            
            BottomCardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){//alignment: .leading 左居中
                    Text("UI Design")
                        .font(.title)//字体格式为title
                        .fontWeight(.semibold)//粗体
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))//accent means 强调
                }
                Spacer()//隔开内容
                Image("Logo1")//logo image
            }
                .padding(.horizontal, 20)//缩进 .horizontal：只应用左右，上下两边不应用 .top：应用上 .bottom:应用下
                .padding(.top,20)
            Spacer()//隔开内容
            Image("Card1")//Card image
                .resizable()//让内容充满整个VStack
                .aspectRatio(contentMode: .fill)//Card image自适应VStack大小 .fit:按比例缩小 .fill：正常大小
                .frame(width:300,height: 100,alignment: .top)//设置宽高，上方设置距离
        }
            .frame(width: 340.0, height: 220.0)//设置VStack 卡片宽高
            .background(Color.black)//背景颜色
            .cornerRadius(20)//圆角
            .shadow(radius:10)//阴影 圆角
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width:340,height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing:20) {
            Rectangle()
                .frame(width: 40, height: 6)
                .cornerRadius(3)
                .opacity(0.1)//透明度
            Text("This certificates is proof that Meng To has achieved hte UI Design course with approval from  a Design+Code instructor.")
                .multilineTextAlignment(.center)//文字居中
                .font(.subheadline)//小标题
                .lineSpacing(4)//行距
            Spacer()
        }
        .padding(.top,8)
        .padding(.horizontal,20)
        .frame(maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x:0,y:500)
    }
}
