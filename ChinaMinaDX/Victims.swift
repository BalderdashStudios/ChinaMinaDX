import SwiftUI
 
struct Victims: View {
    let records = loadPPDRecords()
 
    var body: some View {
        NavigationView {
            List(records) { record in
                NavigationLink(destination: VictimDetailView(record: record)) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(record.mainName ?? "Unknown Name")
                            .font(.headline)
                        if let status = record.detentionStatus {
                            Text(status)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("PPD Database")
            .onAppear {
                print("Victims loaded \(records.count) records")
            }
        }
    }
}
 
struct VictimDetailView: View {
    let record: PPDRecord
 
    var body: some View {
        List {
            section("Identity") {
                row("Name", record.mainName)
                row("Chinese Characters", record.chineseCharacters)
                row("Pinyin Name", record.pinyinName)
                row("Alternate Name", record.alternateName)
                row("Additional Names", record.additionalNames)
                row("Native Characters", record.nameNativeCharacters)
                row("Transliteration", record.nameTransliteration)
                row("Sex", record.sex)
                row("Date of Birth", record.dateOfBirth)
                row("Ethnic Group", record.ethnicGroup)
                row("Religion", record.religion)
                row("Occupation", record.occupation)
                row("Affiliation", record.affiliation)
                row("Family", record.family)
            }
 
            section("Location") {
                row("Origin", record.origin)
                row("Residence", record.residence)
            }
 
            section("Detention") {
                row("CECC Record #", record.ceccRecordNumber)
                row("Status", record.detentionStatus)
                row("Detention Date", record.detentionDate)
                row("Formal Arrest Date", record.formalArrestDate)
                row("Facility", record.currentOrLastDetentionFacility)
                row("Legal Advisor", record.legalAdvisor)
                row("Issues", record.issues)
            }
 
            section("Sentence") {
                row("Years", record.sentenceLengthYears.map { String($0) })
                row("Months", record.months.map { String($0) })
                row("Days", record.days.map { String($0) })
                row("Sentence Details", record.sentenceDetails)
                row("Official End Date", record.officialEndDateOfSentence)
                row("Expected Release", record.expectedReleaseDate)
                row("Actual Release", record.actualReleaseDate)
            }
 
            if let summary = record.shortSummary?.strippingHTML(), !summary.isEmpty {
                section("Summary") {
                    Text(summary)
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
 
            if let timeline = record.detentionTimeline, !timeline.isEmpty {
                section("Timeline") {
                    Text(timeline)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle(record.mainName ?? "Detail")
        .navigationBarTitleDisplayMode(.large)
    }
 
    @ViewBuilder
    private func section<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        Section(header: Text(title).fontWeight(.semibold)) {
            content()
        }
    }
 
    @ViewBuilder
    private func row(_ label: String, _ value: String?) -> some View {
        if let value, !value.isEmpty {
            HStack(alignment: .top, spacing: 8) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(width: 130, alignment: .leading)
                Text(value)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 2)
        }
    }
}
 
private extension String {
    func strippingHTML() -> String {
        guard let data = self.data(using: .utf8),
              let attributed = try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        else {
            return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        }
        return attributed.string
    }
}
 
#Preview {
    Victims()
}
