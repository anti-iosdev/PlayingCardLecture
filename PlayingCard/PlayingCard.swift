//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Anti on 9/19/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    var description: String { return "\(rank)-\(suit)"}
    
    var suit: Suit
    var rank: Rank
    
    
    // Making the return an Int for the enum implicitly orders the cases.
    // These are considered 'raw values' or 'associated values'
    enum Suit: String, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "❤️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades,.hearts,.diamonds,.clubs]
        
        var description: String { return rawValue }
    }
    
    enum Rank: CustomStringConvertible {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            return allRanks
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
    }
}
