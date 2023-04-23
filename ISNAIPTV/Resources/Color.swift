//
//  Color.swift
//  XtreamIPTV
//
//  Created by Dev on 23/10/2022.
//

import SwiftUI

extension Color {
  
    public static var darkBG: Color {
        return Color(UIColor(red: 17/255, green: 19/255, blue: 48/255, alpha: 1.0))
       // return Color.white
        
    }
    
    public static var lightBlue: Color {
        return Color(UIColor(red: 95/255, green: 226/255, blue: 230/255, alpha: 1.0))
       // return Color.white
        
    }
    
    public static var light1: Color {
        return Color(UIColor(red: 208/255, green: 240/255, blue: 255/255, alpha: 1.0))
    }
   
    public static var light2: Color {
        return Color(UIColor(red: 215/255, green: 243/255, blue: 220/255, alpha: 1.0))
    }
    
    public static var light3: Color {
        return Color(UIColor(red: 255/255, green: 199/255, blue: 197/255, alpha: 1.0))
    }
    
    public static var light4: Color {
        return Color(UIColor(red: 255/255, green: 242/255, blue: 210/255, alpha: 1.0))
    }
    
//    public static var light1: Color {
//        return Color(UIColor(red: 172/255, green: 216/255, blue: 211/255, alpha: 1.0))
//    }
//
//    public static var light2: Color {
//        return Color(UIColor(red: 239/255, green: 199/255, blue: 176/255, alpha: 1.0))
//    }
//
//    public static var light3: Color {
//        return Color(UIColor(red: 175/255, green: 241/255, blue: 255/255, alpha: 1.0))
//    }
//
//    public static var light4: Color {
//        return Color(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0))
//    }
//
//    public static var light5: Color {
//        return Color(UIColor(red: 224/255, green: 231/255, blue: 243/255, alpha: 1.0))
//    }
//
//    public static var light6: Color {
//        return Color(UIColor(red: 241/255, green: 206/255, blue: 156/255, alpha: 1.0))
//    }
    
    static func getLightColor(index : Int)->Color{
        let lightColors = [light1,light2,light3,light4]
        return lightColors[index%lightColors.count]
    }
}
