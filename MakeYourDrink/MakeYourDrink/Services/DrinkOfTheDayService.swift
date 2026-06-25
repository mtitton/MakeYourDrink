//
//  DrinkOfTheDayService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum DrinkOfTheDayService {

    static func drink(
        from matches: [DrinkMatch]
    ) -> DrinkMatch? {

        guard !matches.isEmpty else {
            return nil
        }

        let day = Calendar.current.ordinality(
            of: .day,
            in: .year,
            for: Date()
        ) ?? 1

        return matches[day % matches.count]
    }
}
