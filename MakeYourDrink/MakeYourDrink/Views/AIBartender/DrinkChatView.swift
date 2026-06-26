//
//  DrinkChatView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 26/06/26.
//

import SwiftUI

struct DrinkChatView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    let suggestion: AIBartenderSuggestion

    @State private var messages: [DrinkChatMessage] = []
    @State private var inputText = ""
    @State private var isLoading = false

    private let quickQuestions = [
        "Posso substituir algum ingrediente?",
        "Como faço para 4 pessoas?",
        "Como deixo mais doce?",
        "Como faço uma versão sem álcool?",
        "Combina com qual comida?"
    ]

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        quickQuestionsSection

                        ForEach(messages) { message in
                            messageBubble(message)
                        }

                        if isLoading {
                            HStack {
                                ProgressView()
                                    .tint(DrinkColors.accent)

                                Text("Bartender pensando...")
                                    .font(.caption)
                                    .foregroundStyle(DrinkColors.textSecondary)

                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 16)
                }

                inputBar
            }
        }
        .navigationTitle("Perguntar ao Bartender")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(suggestion.name)
                .font(.title2.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Faça perguntas sobre substituições, preparo, variações e harmonização.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.card)
    }

    private var quickQuestionsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(quickQuestions, id: \.self) { question in
                    Button {
                        send(question)
                    } label: {
                        Text(question)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(DrinkColors.accent)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .disabled(isLoading)
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private func messageBubble(_ message: DrinkChatMessage) -> some View {
        HStack {
            if message.role == .bartender {
                bubble(message)
                Spacer(minLength: 40)
            } else {
                Spacer(minLength: 40)
                bubble(message)
            }
        }
        .padding(.horizontal, 20)
    }

    private func bubble(_ message: DrinkChatMessage) -> some View {
        Text(message.text)
            .font(.subheadline)
            .foregroundStyle(
                message.role == .user
                ? .black
                : DrinkColors.textPrimary
            )
            .padding(14)
            .background(
                message.role == .user
                ? DrinkColors.accent
                : DrinkColors.card
            )
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var inputBar: some View {
        HStack(spacing: 10) {
            TextField("Pergunte sobre esse drink", text: $inputText)
                .foregroundStyle(DrinkColors.textPrimary)
                .padding(14)
                .background(DrinkColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            Button {
                send(inputText)
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(
                        inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        ? DrinkColors.textSecondary
                        : DrinkColors.accent
                    )
            }
            .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isLoading)
        }
        .padding(16)
        .background(DrinkColors.background)
    }

    private func send(_ text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmed.isEmpty else { return }

        inputText = ""
        HapticService.light()

        let userMessage = DrinkChatMessage(
            role: .user,
            text: trimmed
        )

        messages.append(userMessage)
        isLoading = true

        Task {
            let answer = await DrinkChatService.ask(
                question: trimmed,
                suggestion: suggestion,
                previousMessages: messages,
                appState: appState
            )

            await MainActor.run {
                messages.append(
                    DrinkChatMessage(
                        role: .bartender,
                        text: answer
                    )
                )

                isLoading = false
                HapticService.success()
            }
        }
    }
}
