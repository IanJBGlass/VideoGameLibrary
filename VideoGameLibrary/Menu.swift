//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Jacob Glass on 9/11/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import Foundation

class Menu {
    var shouldQuit = false //When this is true, we should quit running the video game library.
    
    var libraryCall = Library()
    
    func go() {
        while !shouldQuit {
            printMenu()
            var input = getInput()
            handleInput(input)
        }
    }
    
    func printMenu() {
        print("""
Please choose the number that corresponds with you preferred option.
                
                 1: Add Game
                 2: Remove Game
                 3: List Available Games
                 4: List Unavailable Games
                 5: Check In Game
                 6: Check Out Game
                 7: Quit
""")
        
        
    }
    func quit() {
        shouldQuit = true
        print("Thank you for using Suichi's Video Game Library!")
    }
    
    func getInput() -> String {
        //Take user input using readLine. Check to make sure that the input isn't nil or it's not an empty String. If it's valid input, return the input. Otherwise, make the user enter input again.
        var userInput = readLine()
        
        while userInput == nil || userInput == "" {
            print("Please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
    
//    func validateInput(_ input : String) -> Bool {
//
//    }
    
    
    
    
    func handleInput(_ input : String) {
        switch input {
        case "1":
            print("Please enter your new game and its genre.")
            libraryCall.addGame()
        case "2":
            print("Please enter the game you wish to remove.")
            libraryCall.removeGame()
        case "3":
            print("Listing available games.")
            libraryCall.listAvailableGames()
        case "4":
            print("Listing unavailable games and their due dates.")
            libraryCall.listUnavailableGames()
        case "5":
            print("Enter the game you wish to check in.")
            libraryCall.checkGameIn()
        case "6":
            print("Enter the game you wish to check out")
            libraryCall.checkOutGame()
        case "7":
           print("Exiting Library")
            quit()
        default:
            break
        }
    }
}



















