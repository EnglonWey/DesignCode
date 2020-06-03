//
//  MenuView.swift
//  DesignCode
//
//  Created by 英伦 on 2020/6/3.
//  Copyright © 2020 英伦. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Meng - 28% complete")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38,height: 6)
                    .cornerRadius(3)
                    .frame(width: 130,height: 6,alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.03))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
                .frame(maxWidth: .infinity)//边距无限大
                .frame(height: 300)
                .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) ,Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .padding(.horizontal, 30)
                .overlay(
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())//圆形头像
                        .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String//文本
    var icon: String//图标
    
    var body: some View {
        HStack(spacing : 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))//格式
                .imageScale(.large)//图片格式 粗细
                .frame(width: 32,height: 32)//图标对齐
            .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120,alignment: .leading)//文本对齐
        }
    }
}
