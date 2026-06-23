//
//  ScanIngredientsView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI
import PhotosUI

struct ScanIngredientsView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var selectedUIImage: UIImage?

    @State private var isScanning = false
    @State private var scanCompleted = false
    @State private var detectedIngredients: [Ingredient] = []

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    header
                    scannerPreview

                    if scanCompleted {
                        resultSection
                        actionButtons
                    } else {
                        photoButton
                        scanButton
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Scan")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: selectedPhoto) { _, newValue in
            loadImage(from: newValue)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Escaneie seus ingredientes")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Escolha uma foto com rótulos visíveis para detectar ingredientes.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var scannerPreview: some View {
        RoundedRectangle(cornerRadius: 32, style: .continuous)
            .fill(DrinkColors.card)
            .frame(height: 320)
            .overlay {
                if let selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFill()
                        .frame(height: 320)
                        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                        .overlay {
                            if isScanning {
                                scanningOverlay
                            }
                        }
                } else {
                    emptyPreview
                }
            }
            .clipped()
    }

    private var emptyPreview: some View {
        VStack(spacing: 18) {
            Image(systemName: "photo.on.rectangle.angled")
                .font(.system(size: 64))
                .foregroundStyle(DrinkColors.accent)

            Text("Nenhuma foto selecionada")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Escolha uma imagem para analisar.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var scanningOverlay: some View {
        ZStack {
            Color.black.opacity(0.55)

            VStack(spacing: 16) {
                ProgressView()
                    .tint(DrinkColors.accent)

                Text("Analisando imagem...")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
    }

    @ViewBuilder
    private var resultSection: some View {
        if detectedIngredients.isEmpty {
            emptyResultSection
        } else {
            detectedSection
        }
    }

    private var detectedSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Ingredientes encontrados")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            FlowLayout(spacing: 10) {
                ForEach(detectedIngredients) { ingredient in
                    IngredientPill(name: ingredient.name)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var emptyResultSection: some View {
        VStack(spacing: 14) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 42))
                .foregroundStyle(DrinkColors.accent)

            Text("Nenhum ingrediente encontrado")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Tente uma foto com rótulos mais próximos ou selecione manualmente.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var photoButton: some View {
        PhotosPicker(
            selection: $selectedPhoto,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Text(selectedImage == nil ? "Escolher Foto" : "Trocar Foto")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private var scanButton: some View {
        Button {
            startScan()
        } label: {
            Text("Analisar Foto")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(selectedUIImage == nil ? DrinkColors.textSecondary : DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .disabled(selectedUIImage == nil || isScanning)
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            if !detectedIngredients.isEmpty {
                addButton
            }

            PhotosPicker(
                selection: $selectedPhoto,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Text("Analisar outra foto")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }

            NavigationLink {
                MyBarView()
            } label: {
                Text("Selecionar manualmente")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .buttonStyle(.plain)
        }
    }

    private var addButton: some View {
        Button {
            for ingredient in detectedIngredients {
                if !appState.userIngredients.contains(ingredient) {
                    appState.userIngredients.append(ingredient)
                }
            }

            dismiss()
        } label: {
            Text("Adicionar ao Meu Bar")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private func loadImage(from item: PhotosPickerItem?) {
        guard let item else { return }

        scanCompleted = false
        detectedIngredients = []

        Task {
            guard let data = try? await item.loadTransferable(type: Data.self),
                  let uiImage = UIImage(data: data) else {
                return
            }

            await MainActor.run {
                selectedUIImage = uiImage
                selectedImage = Image(uiImage: uiImage)
            }
        }
    }

    private func startScan() {
        guard let selectedUIImage else { return }

        isScanning = true
        scanCompleted = false
        detectedIngredients = []

        Task {
            let ingredients = await VisionIngredientScanner.scan(image: selectedUIImage)

            await MainActor.run {
                detectedIngredients = ingredients
                isScanning = false
                scanCompleted = true
            }
        }
    }
}
