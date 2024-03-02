//
//  FormatDateTime.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import Foundation

func formatTime(_ dateTime: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    guard let decodedTime = formatter.date(from: dateTime) else { return dateTime }
    formatter.dateFormat = "h:mma"
    return formatter.string(from: decodedTime)
}

func formatDate(_ dateStr: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    guard let date = formatter.date(from: dateStr) else { return dateStr }
    formatter.dateFormat = "d'th' MMM"
    return formatter.string(from: date)
}
