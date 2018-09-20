//
//  MacroUtils.swift
//  swift_study1
//
//  Created by linkage on 2018/7/13.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.height
let SCREEN_WIDTH = UIScreen.main.bounds.width

let SCREEN_WIDTH_FACTOR = SCREEN_WIDTH / 667
let SCREEN_HEIGHT_FACTOR = SCREEN_HEIGHT / 375.0


func X(object:UIView)->CGFloat{
    return object.frame.origin.x
}

func Y(object:UIView)->CGFloat{
    return object.frame.origin.y
}

func Max_X(object:UIView)->CGFloat{
    
    return object.frame.origin.x + W(object: object)
}

func Max_Y(object:UIView)->CGFloat{
    return object.frame.origin.y + H(object: object)
}

func W(object:UIView)->CGFloat{
    return object.frame.size.width
}

func H(object:UIView)->CGFloat{
    return object.frame.size.height
}

func Auto_X(object:UIView)->CGFloat{
    return object.frame.origin.x * SCREEN_WIDTH_FACTOR
}

func Auto_Y(object:UIView)->CGFloat{
    return object.frame.origin.y * SCREEN_HEIGHT_FACTOR
}

func Auto_W(object:UIView)->CGFloat{
    return object.frame.size.width * SCREEN_WIDTH_FACTOR
}

func Auto_H(object:UIView)->CGFloat{
    return object.frame.size.height * SCREEN_HEIGHT_FACTOR
}


