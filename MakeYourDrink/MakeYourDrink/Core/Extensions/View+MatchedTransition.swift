//
//  View+MatchedTransition.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import SwiftUI

extension View {
    @ViewBuilder
    func applyMatchedTransitionSource(
        id: UUID,
        namespace: Namespace.ID?
    ) -> some View {
        if let namespace {
            self.matchedTransitionSource(id: id, in: namespace)
        } else {
            self
        }
    }

    @ViewBuilder
    func applyNavigationTransition(
        id: UUID,
        namespace: Namespace.ID?
    ) -> some View {
        if let namespace {
            self.navigationTransition(.zoom(sourceID: id, in: namespace))
        } else {
            self
        }
    }
}
