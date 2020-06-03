//
//  ContentView.swift
//  DesignCode
//
//  Created by 英伦 on 2020/6/1.
//  Copyright © 2020 英伦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack{
            TitleView()
                .blur(radius:show ? 20 : 0)//模糊
                .opacity(showCard ? 0.4 : 1)
                .offset( y: showCard ? -200 :0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)//延迟
                    //                      .speed(2)//速度
                    //                      .repeatForever(autoreverses: true)//重复循环
            )
            
            BackCardView()//偏移
                .frame(width:showCard ? 300 : 340,height: 220)
                .background(show ? Color("card3") : Color("card4"))//背景颜色
                .cornerRadius(20)//圆角
                .shadow(radius: 20)//阴影
                .offset( x : 0,y:show ? -400 : -40)//偏移
                .offset( x : viewState.width, y : viewState.height)
                .offset( y : showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)//缩进？
                .rotationEffect(.degrees(show ? 0 : 10))//旋转 angle:角度
                .rotationEffect(Angle( degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle( degrees: showCard ? 0 : 10), axis: ( x : 10.0 , y : 0, z : 0))//3D旋转
                .blendMode(.hardLight)//.hardLight 高光
                .animation(.easeInOut(duration : 0.5))
            
            BackCardView()//偏移
                .frame(width : 340,height : 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x : 0 , y : show ? -200 : -20)
                .offset(x : viewState.width, y : viewState.height)
                .offset(y : showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: ( x : 10.0,y : 0,z : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration : 0.3))
            
            CardView()//卡片整合代码
                .frame(width:showCard ? 375 : 340.0, height: 220.0)//设置VStack 卡片宽高
                .background(Color.black)//背景颜色
                //                .cornerRadius(20)//圆角
                .clipShape(RoundedRectangle(cornerRadius :showCard ? 30 : 20, style: .continuous))
                .shadow(radius:10)//阴影 圆角
                .offset(x : viewState.width, y : viewState.height)
                .offset(y : showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response : 0.3, dampingFraction : 0.6, blendDuration : 0))//response 滞后时间，dampingFraction 反弹力度，
                .onTapGesture {
                    self.showCard.toggle()//onTapGesture 点击时间 true&false 切换
            }
            .gesture(
                DragGesture().onChanged{ value in
                    self.viewState=value.translation
                    self.show=true
                }
                .onEnded{ value in
                    self.viewState = .zero
                    self.show=false
                }//拖动卡片 DragGesture().onChanged 获取拖动位置，onEnged 松开后
            )
            
//            Text("\(bottomState.height)").offset(y: -300)
            
            BottomCardView()
                .offset(x : 0,y : showCard ? 360 : 1000)
                .offset(y : bottomState.height)
                .blur(radius : show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration : 0.8))
                .gesture(
                    DragGesture().onChanged{value in
                        self.bottomState = value.translation
                        if self.showFull{
                            self.bottomState.height += -300
                        }
                        
                        if self.bottomState.height < -300{
                            self.bottomState.height = -300
                        }//限制最多上拉到-300的位置
                    }
                    .onEnded{value in
                        if self.bottomState.height > 50{
                            self.showCard = false
                        }//小于50隐藏
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull){
                            self.bottomState.height = -300
                            self.showFull = true
                        }
                        else{
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
            )
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
                .aspectRatio(contentMode : .fill)//Card image自适应VStack大小 .fit:按比例缩小 .fill：正常大小
                .frame(width : 300,height : 100,alignment : .top)//设置宽高，上方设置距离
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
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
                .frame(width : 40, height : 6)
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
        .frame(maxWidth :.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius : 20)
        
    }
}
