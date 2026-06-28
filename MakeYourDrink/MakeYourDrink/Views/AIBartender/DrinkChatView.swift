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
                FadeInView(delay: 0.00) {
                    header
                }

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        FadeInView(delay: 0.05) {
                            quickQuestionsSection
                        }

                        if messages.isEmpty {
                            FadeInView(delay: 0.10) {
                                emptyConversationCard
                            }
                        }

                        ForEach(Array(messages.enumerated()), id: \.element.id) { index, message in
                            FadeInView(delay: Double(index) * 0.03) {
                                messageBubble(message)
                            }
                        }

                        if isLoading {
                            FadeInView(delay: 0.00) {
                                loadingBubble
                            }
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
        PremiumCard {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .font(.title3)
                        .foregroundStyle(DrinkColors.accent)

                    Text(suggestion.name)
                        .font(.title2.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Spacer()
                }

                Text("Faça perguntas sobre substituições, preparo, variações e harmonização.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
        .scaleOnAppear()
    }

    private var emptyConversationCard: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 12) {
                Text("Seu bartender está pronto")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Pergunte como adaptar o drink, trocar ingredientes, servir mais pessoas ou harmonizar com comida.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
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
                    .buttonStyle(PremiumButtonStyle())
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
                Spacer(minLength: 44)
            } else {
                Spacer(minLength: 44)
                bubble(message)
            }
        }
        .padding(.horizontal, 20)
    }

    private func bubble(_ message: DrinkChatMessage) -> some View {
        Text(message.text)
            .font(.subheadline)
            .lineSpacing(3)
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
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(
                        message.role == .user
                        ? Color.clear
                        : Color.white.opacity(0.05),
                        lineWidth: 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .scaleOnAppear()
    }

    private var loadingBubble: some View {
        HStack {
            HStack(spacing: 10) {
                ProgressView()
                    .tint(DrinkColors.accent)

                Text("Bartender pensando...")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
            .padding(14)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

            Spacer(minLength: 44)
        }
        .padding(.horizontal, 20)
    }

    private var inputBar: some View {
        HStack(spacing: 10) {
            TextField("Pergunte sobre esse drink", text: $inputText)
                .foregroundStyle(DrinkColors.textPrimary)
                .padding(14)
                .background(DrinkColors.card)
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.05), lineWidth: 1)
                }
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
            .buttonStyle(PremiumButtonStyle())
        }
        .padding(16)
        .background(.ultraThinMaterial)
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

        withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
            messages.append(userMessage)
            isLoading = true
        }

        Task {
            let answer = await DrinkChatService.ask(
                question: trimmed,
                suggestion: suggestion,
                previousMessages: messages,
                appState: appState
            )

            await MainActor.run {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                    messages.append(
                        DrinkChatMessage(
                            role: .bartender,
                            text: answer
                        )
                    )

                    isLoading = false
                }

                HapticService.success()
            }
        }
    }
}
