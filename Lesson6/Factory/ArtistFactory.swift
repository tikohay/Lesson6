//
//  Factory.swift
//  Lesson6
//
//  Created by Karakhanyan Tigran on 27.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ArtistFactoryProtocol {
    func getArtistList() -> [Artist]
    func getArtistDetail(atIndex index: Int) -> Artist
}

class ArtistFactory: ArtistFactoryProtocol {
    
    let artists = [Artist(
        identifier: 1,
        name: "John Lennon",
        albums: [
            Album(
                name: "Imagine",
                songs: [
                    Song(name: "Imagine", duration: 180),
                    Song(name: "Crippled Inside", duration: 227),
                    Song(name: "Jealous Guy", duration: 254),
                    Song(name: "It's So Hard", duration: 205),
                    Song(name: "I Don't Want to Be a Soldier", duration: 365),
                    Song(name: "Gimme Some Truth", duration: 196),
                    Song(name: "Oh My Love", duration: 170),
                    Song(name: "How Do You Sleep?", duration: 336),
                    Song(name: "How?", duration: 223),
                    Song(name: "Oh Yoko!", duration: 260)
                ],
                date: Date(timeIntervalSince1970: 53222400)
            )
        ]
    ), Artist(
        identifier: 2,
        name: "System of a down",
        albums: [
            Album(
                name: "SOAD",
                songs: [
                    Song(name: "Chop suey", duration: 180),
                    Song(name: "Aerials", duration: 227),
                    Song(name: "Toxicity", duration: 254),
                    Song(name: "B.Y.O.B", duration: 205),
                    Song(name: "Lonely day", duration: 365)
                ],
                date: Date(timeIntervalSince1970: 53222400)
            )
        ]
    )]
    
    func getArtistList() -> [Artist] {
        return artists
    }
    
    func getArtistDetail(atIndex index: Int) -> Artist {
        return artists[index]
    }
}


