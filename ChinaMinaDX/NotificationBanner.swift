// NotificationBanner.swift
// Simple notification banner system for top-of-screen popups

import SwiftUI
internal import Combine

// ObservableObject to trigger notifications from anywhere
class NotificationManager: ObservableObject {
    
    @Published var message: String = ""
    @Published var isVisible: Bool = false
    var dismissTask: Task<Void, Never>? = nil

    func show(message: String, duration: Double = 2.0) {
        self.message = message
        withAnimation {
            isVisible = true
        }
        dismissTask?.cancel()
        dismissTask = Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            withAnimation {
                isVisible = false
            }
        }
    }
}

struct NotificationBanner: View {
    let message: String
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    // Avatar (replace this with a circle with 'XJ' or a person/flag icon)
                    Image("XI")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 3)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Xi Jinping")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.primary)
                        Text(message)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(.systemBackground).opacity(0.95))
                        .shadow(color: Color.black.opacity(0.25), radius: 12, y: 6)
                )
                .padding(.top, 18)
                .padding(.horizontal, 18)
                .transition(.move(edge: .top).combined(with: .opacity))
                Spacer()
            }
            .zIndex(100)
            .animation(.easeInOut(duration: 0.25), value: isVisible)
        }
    }
}

