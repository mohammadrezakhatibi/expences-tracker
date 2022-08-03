//
//  ExpencesAPI.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation

struct Expense {
    
    var id: UUID
    var title: String
    var category: Expense.Category
    var icon: String
    var date: String
    
    enum Category: String, CaseIterable {
        case food = "Food"
        case travel = "Travel"
        case bill = "Bill"
        case gym = "Gym"
        case tickets = "Tickets"
    }
}

class ExpensesAPI {
    
    static var shared = ExpensesAPI()
    
    func loadExpenses(compeltion: @escaping (Result<[Expense], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1)  {
            compeltion(.success(
                [
                    Expense(
                        id: UUID(),
                        title: "McDonalds",
                        category: .food,
                        icon: "takeoutbag.and.cup.and.straw",
                        date: Date().ISO8601Format()),
                    Expense(
                        id: UUID(),
                        title: "Flight Ticket",
                        category: .travel,
                        icon: "airplane.departure",
                        date: Date().ISO8601Format()),
                    Expense(
                        id: UUID(),
                        title: "Water Bill",
                        category: .bill,
                        icon: "list.dash.header.rectangle",
                        date: Date().ISO8601Format())
                ]
            ))
        }
    }
}
