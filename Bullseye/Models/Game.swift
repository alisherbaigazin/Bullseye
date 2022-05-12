//
//  Game.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 13.03.2022.
//

import Foundation

struct Leaderboard {
    var score: Int
    var date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var round = 1
    var score = 0
    var leaderboardEntries: [Leaderboard] = []
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        leaderboardEntries.append(Leaderboard(score: points, date: Date()))
        leaderboardEntries.sort {$0.score > $1.score}
    }
    
    mutating func restart() {
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
}
