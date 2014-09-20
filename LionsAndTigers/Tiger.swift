//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Cade on 9/17/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image:UIImage = UIImage(named: "")
    
    func chuff () {
        println("Tiger: Chuff!")
    }
    
    func chuffANumberOfTime(numberOfTimes:Int) {
        for (var i = 0; i < numberOfTimes; i++) {
            self.chuff()
        }
    }
    
    func randomFact() -> String {
        let i = Int(arc4random_uniform(UInt32(3)))
        var facts = ["The tiger is the biggest of the cat family", "Tigers can reach a length 3.3 meters", "A group of tigers is known as an ambush"]
        return facts[i]
    }
}