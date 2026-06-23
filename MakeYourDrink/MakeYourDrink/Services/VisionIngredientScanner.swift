//
//  VisionIngredientScanner.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import UIKit
import Vision

enum VisionIngredientScanner {
    static func scan(image: UIImage) async -> [Ingredient] {
        guard let cgImage = image.cgImage else {
            return []
        }

        return await withCheckedContinuation { continuation in
            let request = VNRecognizeTextRequest { request, _ in
                let recognizedText = extractText(from: request)
                let ingredients = matchIngredients(in: recognizedText)

                continuation.resume(returning: ingredients)
            }

            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = true
            request.recognitionLanguages = ["pt-BR", "en-US"]

            let handler = VNImageRequestHandler(cgImage: cgImage)

            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform([request])
                } catch {
                    continuation.resume(returning: [])
                }
            }
        }
    }

    private static func extractText(from request: VNRequest) -> String {
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return ""
        }

        return observations
            .compactMap { $0.topCandidates(1).first?.string }
            .joined(separator: " ")
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }

    private static func matchIngredients(in text: String) -> [Ingredient] {
        MockData.ingredients.filter { ingredient in
            let normalizedName = ingredient.name
                .lowercased()
                .folding(options: .diacriticInsensitive, locale: .current)

            return text.contains(normalizedName) ||
            synonyms(for: ingredient.name).contains { text.contains($0) }
        }
    }

    private static func synonyms(for ingredientName: String) -> [String] {
        switch ingredientName.lowercased() {
        case "água tônica":
            return ["tonica", "tonic", "tonic water"]
        case "água com gás":
            return ["sparkling water", "soda water", "club soda"]
        case "refrigerante cola":
            return ["cola", "coca", "coke"]
        case "suco de laranja":
            return ["orange juice"]
        case "limão":
            return ["lima", "lime", "lemon"]
        case "laranja":
            return ["orange"]
        case "açúcar":
            return ["sugar"]
        case "gelo":
            return ["ice"]
        case "hortelã":
            return ["mint"]
        case "morango":
            return ["strawberry"]
        case "maracujá":
            return ["passion fruit"]
        default:
            return []
        }
    }
}
