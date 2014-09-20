// Playground - noun: a place where people can play

import UIKit

// not initialized
// var tigerNames:Array<String>

// initialized
// var tigerNames:Array<String> = []

// var tigerNames:[String]

var tigerNames = ["string1", "string2"]
var tigerAges = [2, 3, 4, 5]

var tigerBreed:Array<String> = []

if (tigerBreed.isEmpty) {
    println("Yeah, its empty!")
}

for tigerAge in 1...3 {
    println(tigerAge)
}

for tigerName in tigerNames {
    println(tigerName)
}