//
//  DateConverter.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 23/07/2022.
//

import Foundation

extension Date {
    
    func convertDate(withFormat: String) -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = withFormat

        // Convert Date to String
        return dateFormatter.string(from: self)
    }
    
    func addToDate(byDays: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: byDays, to: self)
    }
}
