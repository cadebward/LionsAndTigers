//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Cade on 9/17/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var factLabel: UILabel!
    
    var tigers:[Tiger] = []
    var lions:[Lion] = []
    var currentIndex: Int = 0
    
    var currentAnimal = ("Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tiger = Tiger()
        tiger.name = "Tigger"
        tiger.breed = "Bengal"
        tiger.age = 3
        tiger.image = UIImage(named: "BengalTiger.jpg")
        
        tigers.append(tiger)
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        tigers.append(secondTiger)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        tigers.append(thirdTiger)
        
        var forthTiger = Tiger()
        forthTiger.name = "Spar"
        forthTiger.breed = "Siberian"
        forthTiger.age = 5
        forthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        tigers.append(forthTiger)
        
        nameLabel.text = "Press next to see a frickin' random tiger!"
        ageLabel.text = ""
        breedLabel.text = ""
        
        currentIndex = 0
        
        // initialize app with a tiger
        ImageView.image = tiger.image
        nameLabel.text = tiger.name
        ageLabel.text = "\(tiger.age)"
        breedLabel.text = tiger.breed
        factLabel.text = tiger.randomFact()
        
        var lion = Lion()
        lion.name = "Mufasa"
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lions += [lion, lioness]
        
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            currentAnimal = ("Lion", rand(lions.count))
        default:
            currentAnimal = ("Tiger", rand(tigers.count))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        // create a random number
        var randomIndex = rand(tigers.count)
        
        // ensure that the random index is not the same as before
        while randomIndex == currentIndex {
            randomIndex = rand(tigers.count)
        }
        
        let tiger = tigers[randomIndex]
        currentIndex = randomIndex
        
        // view transition
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
        
            // assign values from that random tiger to the UI
            self.ImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.factLabel.text = tiger.randomFact()
            
            }, completion: { (finished: Bool) -> () in
                
        })
    }
    
    func rand(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }

}

