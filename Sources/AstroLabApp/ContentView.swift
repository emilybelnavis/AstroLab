import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Label("Sky", systemImage: "sparkles")
                Label("Equipment", systemImage: "camera")
                Label("Capture", systemImage: "camera.aperture")
                Label("Scheduler", systemImage: "calendar.badge.clock")
                Label("Analyze", systemImage: "chart.xyaxis.line")
            }
            .navigationTitle("AstroLab")
        } detail: {
            ContentUnavailableView(
                "Project Meridian",
                systemImage: "moon.stars",
                description: Text("Initial AstroLab application scaffold")
            )
        }
        .frame(minWidth: 960, minHeight: 640)
    }
}
