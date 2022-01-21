//
//  Home.swift
//  UI-429
//
//  Created by nyannyan0328 on 2022/01/21.
//

import SwiftUI

struct Home: View {
    @State var colors : [ColorGrid] = [
        ColorGrid(hexValue: "#15654B", color: Color("Green")),
        ColorGrid(hexValue: "#DAA4FF", color: Color("Violet")),
        ColorGrid(hexValue: "#FFD90A", color: Color("Yellow")),
        ColorGrid(hexValue: "#FE9EC4", color: Color("Pink")),
        ColorGrid(hexValue: "#FB3272", color: Color("Orange")),
        ColorGrid(hexValue: "#4460EE", color: Color("Blue")),
    
    
    ]
    
    @State var animations : [Bool] = Array(repeating: false, count: 5)
    
    @State var selectedColor : Color = Color("Pink")
    
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack{
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                }
                .hLeading()
                
                
                Button {
                    
                } label: {
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }


            }
            .padding([.horizontal,.top])
            .padding(.bottom,5)
            
            
            GeometryReader{proxy in
                
                
                let maxY = proxy.frame(in: .global).maxY
                
                
                creditCardView()
                    .rotation3DEffect(.init(degrees: animations[0] ? 0 : -270), axis: (x: 1, y: 0, z: 0), anchor:.center)
                    .offset(y: animations[0] ? 0 : -maxY)
                
                
                
                
            }
            .frame(height:250)
            
            
            HStack{
                
                
                Text("Chose Color")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.white)
                    .hLeading()
                    .offset(x: animations[1] ? 0 : -200)
                
                
                Button {
                    
                } label: {
                    
                    Text("View All")
                        .font(.callout)
                        .foregroundColor(Color("Pink"))
                        .underline()
                        .offset(x: animations[1] ? 0 : 200)
                }

                
                
                
                
                
            }
            .padding([.horizontal,.top])
            .padding(.bottom,16)
            
            
            
            GeometryReader{proxy in
                
                ZStack{
                    
                    Color.black.clipShape(CustomCorner(corners: [.topRight,.topLeft], radi: 20))
                        .frame(height: animations[2] ? nil : 0)
                        .VBottom()
                    
                    
                    ZStack{
                        
                        
                        ForEach(colors){colorGrid in
                            
                            if !colorGrid.removeFromView{
                                
                                
                                
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(colorGrid.color)
                                    .frame(width: 150, height: (animations[3] ? 60 : 150))
                                    .matchedGeometryEffect(id: colorGrid.id, in: animation)
                                    .rotationEffect(.init(degrees: colorGrid.rotateCards ? 180 : 0))
                            }
                            
                            
                            
                            
                            
                            
                            
                        }
                    }
                    .overlay(
                    
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("BG"))
                            .frame(width: 150, height: (animations[3] ? 60 : 150))
                            .opacity(animations[3] ? 0 : 1)
                           
                    
                    
                    )
                    .scaleEffect(animations[3] ? 1 : 2.2)
                    
                }
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        
                        
                        ForEach(colors){GridColor in
                            
                            
                            GridCardView(colorgrid: GridColor)
                            
                            
                        }
                        
                        
                        
                    }
                    .padding(.top,60)
                    
                }
                
                
            }
            .padding()
            
            
            
        }
        .VTop()
        .hCenter()
        .background(Color("BG"))
        .ignoresSafeArea(.container, edges: .bottom)
        .onAppear(perform: animateScreen)
        
    }
    
    
    @ViewBuilder
    func GridCardView(colorgrid : ColorGrid)->some View{
        
        
        VStack{
            
            
            if colorgrid.addToGrid{
                
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(colorgrid.color)
                    .frame(width: 150, height: 60)
                    .matchedGeometryEffect(id: colorgrid.id, in: animation)
                    .onAppear {
                        
                        
                        if let index = colors.firstIndex(where: { color in
                            
                            colorgrid.id == color.id
                        }){
                            
                            
                            withAnimation{
                                
                                
                                colors[index].showText = true
                                
                                
                                
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                
                                withAnimation{
                                    
                                    
                                    colors[index].removeFromView = true
                                }
                            }
                            
                            
                        }
                        
                        
                    }
                    .onTapGesture {
                        
                        
                        withAnimation{
                            
                            selectedColor = colorgrid.color
                        }
                        
                        
                        
                    }
                
                
                
                
            }
            else{
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.clear)
                    .frame(width: 150, height: 60)
                
                
                
                
            }
            
            
            Text(colorgrid.hexValue)
                .font(.callout.weight(.semibold))
                .foregroundColor(.white)
                .hLeading()
                .padding([.horizontal,.bottom])
                .opacity(colorgrid.showText ? 1 : 0)
        }
        
        
        
    }
    
    func animateScreen(){
        
        
        withAnimation(.interactiveSpring(response: 1.3, dampingFraction: 0.8, blendDuration: 0.8).delay(0.2)){
            
            
            animations[0] = true
        }
        
        withAnimation(.easeInOut.speed(0.3)){
            
            animations[1] = true
        }
        
        
        withAnimation(.interactiveSpring(response: 1.3, dampingFraction: 0.8, blendDuration: 0.8).delay(0.2)){
            
            
            animations[2] = true
        }
        
        
        withAnimation(.easeInOut.delay(0.6)){
            
            animations[3] = true
        }
        
        for index in colors.indices{
            
            
            let delay : Double = (0.9 + Double(index) * 0.1)
            
            let backIndex = ((colors.count - 1) - index)
            
            withAnimation(.easeInOut.delay(delay)){
                
                colors[backIndex].rotateCards = true
                
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                
                withAnimation{
                    
                    colors[backIndex].addToGrid = true
                }
                
                
                
                
            }
            
            
        }
        
        
        
        
        
    }
    
    @ViewBuilder
    func creditCardView()->some View{
        
        ZStack{
            
            
            RoundedRectangle(cornerRadius: 18)
                .fill(selectedColor)
            
            
            VStack{
                
                HStack{
                    
                    ForEach(1...4,id:\.self){index in
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 8, height: 8)
                    }
                    
                    Text("784")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    
                }
                .hLeading()
                .VTop()
                
                
                
                HStack(spacing:-15){
                    
                    Text("jacob Degrom")
                        .font(.title.weight(.bold))
                        .foregroundColor(.white)
                        .hLeading()
                    
                    
                    
                Circle()
                        .stroke(.white,lineWidth: 1)
                        .frame(width: 30, height: 30)
                    
                    
                Circle()
                        .stroke(.white,lineWidth: 1)
                        .frame(width: 30, height: 30)
                      
                }
            
                
            }
            .padding()
            
            
            
            Circle()
                .stroke(
                
                    LinearGradient(colors: [
                    
                    
                        .red,
                        .green,
                        .orange,
                        .purple
                    
                    ], startPoint: .leading, endPoint: .trailing),lineWidth: 20
                
                
                )
                .offset(x: 130, y: -120)
            
            
            
        }
        .clipped()
        .padding()
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


