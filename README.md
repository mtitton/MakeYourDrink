# 🍸 Make Your Drink

**Turn ingredients into cocktails.**

Make Your Drink is an iOS application built with SwiftUI that helps
users discover cocktails and drinks based on ingredients they already
have at home.

The app combines a curated cocktail database, ingredient matching, and
future AI-powered recommendations to act as a personal bartender.

------------------------------------------------------------------------

# Features

## Current MVP

-   Home with personalized drink suggestions
-   Match percentage based on available ingredients
-   My Bar (ingredient inventory)
-   Discover drinks with search and filters
-   Favorites
-   Drink details
-   Local persistence with UserDefaults
-   Dark premium design

------------------------------------------------------------------------

# Planned Features

## Ingredient Input

Users can inform ingredients by:

-   Selecting from a list
-   Typing manually
-   Taking a photo

## Vision Framework

Scan:

-   Kitchen counter
-   Fridge
-   Home bar

Automatically detect ingredients.

## AI Bartender

Examples:

-   "I want something sweet."
-   "Create a drink for a romantic dinner."
-   "I have gin, lime and mint."

The AI creates personalized cocktails.

## Party Mode

Automatically recalculate recipes for multiple people.

## Premium

-   Unlimited scans
-   AI Bartender
-   Personalized recommendations
-   Exclusive recipes

------------------------------------------------------------------------

# Project Structure

``` text
MakeYourDrink
│
├── Core
│   ├── Design
│   └── Extensions
│
├── Models
│
├── Data
│
├── Services
│
├── State
│
├── Views
│   ├── Home
│   ├── MyBar
│   ├── Discover
│   ├── Favorites
│   ├── Profile
│   ├── DrinkDetail
│   └── IngredientInput
│
└── Resources
```

------------------------------------------------------------------------

# Design System

## Colors

  Name             Value
  ---------------- ---------
  Background       #0B0B0F
  Card             #16181D
  Accent           #D4A55A
  Primary Text     #FFFFFF
  Secondary Text   #A1A7B3

Visual style:

-   Premium
-   Elegant
-   Minimalist
-   Apple-inspired

------------------------------------------------------------------------

# Architecture

## Models

### Ingredient

Represents an ingredient available to the user.

### Drink

Represents a cocktail recipe.

### DrinkMatch

Represents the compatibility between a drink and the user's available
ingredients.

------------------------------------------------------------------------

## State

### AppState

Centralized application state.

Stores:

-   User ingredients
-   Favorites
-   Drink matches

------------------------------------------------------------------------

## Services

### DrinkMatcher

Calculates compatibility percentage.

Example:

User:

-   Gin
-   Lime
-   Tonic Water

Drink:

-   Gin
-   Lime
-   Tonic Water
-   Rosemary

Result:

75% Match

------------------------------------------------------------------------

### LocalStorageService

Handles:

-   UserDefaults persistence
-   Favorite drinks
-   User ingredients

------------------------------------------------------------------------

# Roadmap

## Sprint 1

-   Design System
-   Models
-   Navigation
-   Home
-   My Bar
-   Discover
-   Favorites
-   Profile
-   Persistence

✅ Completed

## Sprint 2

-   Ingredient Input
-   Text Parsing
-   Better Match Experience

🚧 In Progress

## Sprint 3

-   Vision Framework
-   Camera Scan

## Sprint 4

-   Apple Intelligence
-   AI Bartender

## Sprint 5

-   Subscriptions
-   App Store Release

------------------------------------------------------------------------

# Long-Term Vision

Make Your Drink is not intended to be just a cocktail recipe catalog.

The goal is to become:

> The smartest bartender in your pocket.

A user should be able to simply show what is available at home and
instantly receive personalized drink suggestions powered by Apple
technologies and AI.
