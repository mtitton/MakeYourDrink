//
//  AIRecipeVersion.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

struct AIRecipeVersion: Identifiable {
    let id: UUID
    let suggestion: AIBartenderSuggestion
    let match: AIRecipeMatch?
    let evolution: AIRecipeEvolution?
    let createdAt: Date

    init(
        id: UUID = UUID(),
        suggestion: AIBartenderSuggestion,
        match: AIRecipeMatch?,
        evolution: AIRecipeEvolution? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.suggestion = suggestion
        self.match = match
        self.evolution = evolution
        self.createdAt = createdAt
    }
}
