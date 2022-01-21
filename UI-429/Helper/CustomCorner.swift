//
//  CustomCorner.swift
//  UI-429
//
//  Created by nyannyan0328 on 2022/01/21.
//

import SwiftUI

struct CustomCorner: Shape {
    
    
    var corners : UIRectCorner
    var radi : CGFloat
    
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radi, height: radi))
        
        
        return Path(path.cgPath)
    }
    
    
   
}

