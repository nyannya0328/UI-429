//
//  Extencions.swift
//  UI-429
//
//  Created by nyannyan0328 on 2022/01/21.
//

import SwiftUI

extension View{
    
    func hLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    func hTrailing()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    
    func hCenter()->some View{
        
        self
            .frame(maxWidth:.infinity)
    }
    
    func VCenter()->some View{
        
        self
            .frame(maxHeight:.infinity)
    }
    
    func VTop()->some View{
        
        self
            .frame(maxHeight:.infinity,alignment: .top)
    }
    
    func VBottom()->some View{
        
        self
            .frame(maxHeight:.infinity,alignment: .bottom)
    }
    
    
    
    
}
