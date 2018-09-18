//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Jacob Glass on 9/13/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import Foundation


class Library {
    var gameArray : [Game] = [Game(title: "Spiderman", genre: "Action"), Game(title: "Despacito", genre: "Horror"), Game(title: "SmUsh", genre: "Platform Fighter"), Game(title: "Sonic '06", genre: "Gods Own Word")]
    
    func addGame() {
        print("Enter title of new game.")
        
        var newGameTitle = readLine()
        var newGameGenre = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title. Please enter the game's title.")
            newGameTitle = readLine()
        }
        
        while newGameGenre == nil || newGameGenre == "" {
            print("Invalid genre. Please enter the game's genre.")
        }
        let newGame = Game(title: newGameTitle!, genre: newGameGenre!)
        gameArray.append(newGame)
    }
    
    func removeGame() {
        //List all of our games titles with a number for the user to select
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        
        print("Please enter the number of the game you want to remove: ")
        
        var userInput = Int(readLine()!)
        //Make a varaible to hold all possible indices for our array
        let validGameIndex = Array(0..<gameArray.count)
        
        //Check to make sure input is not nil and the number entered is not beyond the index of our array
        while userInput == nil || !validGameIndex.contains(userInput!){
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        //Remove the game at the user specified index after input validation
        gameArray.remove(at: userInput!)
    }
    
    func listAvailableGames() {
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
            }
        }
    }
    
    func listUnavailableGames() {
        //We need to go through our gameArray, and check to see if each game is checked out or not. If it is, print out the title of the game.
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy" //Setting the format we want to use for the dateFormatter. In this case, it will use 2 digits for the month, 2 digits for the day, and 4 digits for the year
                    print("This game is due on: \(dateFormatter.string(from: dueDate))") //This will make a string from the dueDate using the format we've specified above.
                }
            }
        }
    }
    
    
    func checkGameIn() {
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        
        print("Please enter the index of the game you wish to check out: ")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        
        gameArray[userInput!].checkedIn = true
        
        gameArray[userInput!].dueDate = nil //Since the game is checked in, we don't need a due date anymore, so set this equal to nil}
    }
    
    
    func checkOutGame() {
        //Loop through our game array and print index and title if game is available to be checked out
        for index in 0..<gameArray.count {
            if gameArray[index].checkedIn == true {
                print("\(index). \(gameArray[index].title)")
            }
        }
        
        print("Please enter the index of the game you wish to check out: ")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        //Change the checkedIn value of our game element at the index provided by the user
        gameArray[userInput!].checkedIn = false
        if userInput! > gameArray.count {
            print("Please input a valid index.")
            userInput = Int(readLine()!)
        }
        
        //Use calendar to add time and establish due date
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        gameArray[userInput!].dueDate = dueDate
        
        //Use dateformatter to print out date as a readable string for the user
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The game is due on : \(dateFormatter.string(from: dueDate!))")
    }
}
