import SwiftUI
 
struct Victims: View {
    let records = loadPPDRecords()
    @State private var alert1 = true
    @State private var alert2 = false
    @Binding var screen2: Bool
    
    @StateObject private var notificationManager = NotificationManager()
    
    @Binding var userData : UserData

    var body: some View {
        
        ZStack{
            
                ZStack{
                    Color.black
                    
                    MatrixRainView()
                    NavigationStack {
                    
                    List(records) { record in
                        NavigationLink(destination: VictimDetailView(record: record)) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(record.mainName ?? "Unknown Name")
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                if let status = record.detentionStatus {
                                    Text(status)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.vertical, 4)
                            .containerBackground(.clear, for: .navigation)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .navigationTitle(Text("PPD Database").foregroundColor(.white))
                        
                    .scrollContentBackground(.hidden)
                    .onAppear {
                        print("Victims loaded \(records.count) records")
                    }
                    
                }
                    .alert(userData.userName, isPresented: $alert1) {
                                // Add custom buttons here. A default "OK" button is provided otherwise.
                        Button("在窃取您的", role: .cancel) { alert2.toggle()}
                            } message: {
                                // Add a detailed message text.
                                Text("YOUR您的 DATA hAs BEEN SEC在URED BY THE CCP")
                            }
                    //Alert 2
                            .alert("Important Message!!!!", isPresented: $alert2) {
                                        // Add custom buttons here. A default "OK" button is provided otherwise.
                                Button("在窃取您的", role: .cancel) {
                                        screen2=true
                                        }
                                    } message: {
                                        // Add a detailed message text.
                                        Text("Click点击the升级upgrade入数button 界面界面to re-enter the data entry interface.")
                                    }
                    
            }
            .ignoresSafeArea()
            
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
                        .foregroundColor(.white)
                }
            }
 
            if let timeline = record.detentionTimeline, !timeline.isEmpty {
                section("Timeline") {
                    Text(timeline)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationTitle(record.mainName ?? "Detail")
        .navigationBarTitleDisplayMode(.large)
        .listRowBackground(Color.clear)
        .scrollContentBackground(.hidden)
        .containerBackground(.clear, for: .navigation)
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
    Victims(screen2: .constant(false), userData: .constant(UserData(userName: "Ider", passWord: "")))
}
