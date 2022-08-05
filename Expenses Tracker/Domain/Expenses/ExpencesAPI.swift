//
//  ExpencesAPI.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation

protocol ExpensesService {
    func loadExpenses(completion: @escaping (Result<[Expense], Error>) -> Void)
}

class ExpensesAPI: ExpensesService {
    
    static var shared = ExpensesAPI()
    
    func loadExpenses(completion: @escaping (Result<[Expense], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1)  {
            completion(.success(
                [
                    Expense(
                        id: UUID(),
                        title: "McDonalds",
                        category: .food,
                        price: 5.80,
                        icon: "takeoutbag.and.cup.and.straw",
                        date: Date().ISO8601Format()),
                    Expense(
                        id: UUID(),
                        title: "Flight Ticket",
                        category: .travel,
                        price: 880,
                        icon: "airplane.departure",
                        date: Date().ISO8601Format()),
                    Expense(
                        id: UUID(),
                        title: "Water Bill",
                        category: .bill,
                        price: 45,
                        icon: "list.dash.header.rectangle",
                        date: Date().ISO8601Format())
                ]
            ))
        }
    }
}

struct Expense: CustomStringConvertible {
    
    var id: UUID
    var title: String
    var category: Expense.Category
    var price: Double
    var icon: String
    var date: String
    
    var description: String {
        "$\(price) in \(category.rawValue)"
    }
    
    enum Category: String, CaseIterable {
        case food = "Food"
        case travel = "Travel"
        case bill = "Bill"
        case gym = "Gym"
        case tickets = "Tickets"
    }
}
