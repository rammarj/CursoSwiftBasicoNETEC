//
//  MenuItems.swift
//  Demo - UIKit
//
//  Created by Salvador Lopez on 5/22/17.
//  Copyright © 2017 Salvador Lopez. All rights reserved.
//

import UIKit

class MenuItems: NSObject {
    
    let names:[String] = [
        "Café de Olla","Expresso","Expresso Doble",
        "Expresso Cortado","Expresso con Crema",
        "Café con Leche","Cappuccino",
        "Mocha","Horchata Caliente",
        "Chocolate Caliente",
        "Té Menta","Té Verde","Té Negro",
        "Té Manzana/Canela","Té Chai",
        "Ponche Tradicional","Panque de Nata","Pastel de Chocolate"]
    
    let prices:[Double] = [
        7.95,11.49,
        8.45,8.45,
        12.75,10.65,
        12.35,10.00,
        16.60,11.25,
        6.50,2.25,6.50,
        9.75,1.25,
        1.25,3.50,3.75
    ]
    
    let specials:[Bool] = [
        false,true,
        false,false,
        false,false,
        true,false,
        false,true,
        false,false,
        false,true,
        false,false,
        true,false]
    
}
