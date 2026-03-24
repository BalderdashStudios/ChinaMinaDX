import Foundation
 
struct PPDRecord: Codable, Identifiable {
    var id: String { ceccRecordNumber ?? UUID().uuidString }
 
    let ceccRecordNumber: String?
    let detentionDate: String?
    let mainName: String?
    let chineseCharacters: String?
    let pinyinName: String?
    let alternateName: String?
    let additionalNames: String?
    let nameNativeCharacters: String?
    let nameTransliteration: String?
    let shortSummary: String?
    let sex: String?
    let dateOfBirth: String?
    let origin: String?
    let residence: String?
    let occupation: String?
    let affiliation: String?
    let ethnicGroup: String?
    let religion: String?
    let family: String?
    let sentenceLengthYears: Double?
    let months: Double?
    let days: Double?
    let expectedReleaseDate: String?
    let actualReleaseDate: String?
    let currentOrLastDetentionFacility: String?
    let formalArrestDate: String?
    let sentenceDetails: String?
    let legalAdvisor: String?
    let officialEndDateOfSentence: String?
    let detentionStatus: String?
    let issues: String?
    let detentionTimeline: String?
 
    enum CodingKeys: String, CodingKey {
        case ceccRecordNumber               = "CECC Record Number"
        case detentionDate                  = "Detention Date"
        case mainName                       = "Main Name"
        case chineseCharacters              = "Chinese characters"
        case pinyinName                     = "Pinyin Name"
        case alternateName                  = "Alternate Name (lay or pen)"
        case additionalNames                = "Additional Name(s)"
        case nameNativeCharacters           = "Name Native Characters (non-Chinese)"
        case nameTransliteration            = "Name Transliteration (non-Chinese)"
        case shortSummary                   = "Short Summary"
        case sex                            = "Sex"
        case dateOfBirth                    = "Date of Birth"
        case origin                         = "Origin"
        case residence                      = "Residence"
        case occupation                     = "Occupation"
        case affiliation                    = "Affiliation"
        case ethnicGroup                    = "Ethnic Group"
        case religion                       = "Religion"
        case family                         = "Family"
        case sentenceLengthYears            = "Sentence Length Years"
        case months                         = "Months"
        case days                           = "Days"
        case expectedReleaseDate            = "Expected Release Date"
        case actualReleaseDate              = "Actual Release Date"
        case currentOrLastDetentionFacility = "Current or Last Detention Facility"
        case formalArrestDate               = "Formal Arrest Date"
        case sentenceDetails                = "Sentence Details"
        case legalAdvisor                   = "Legal Advisor"
        case officialEndDateOfSentence      = "Official End Date of Sentence"
        case detentionStatus                = "Detention Status"
        case issues                         = "Issues"
        case detentionTimeline              = "Detention Timeline "
    }
}
 
func loadPPDRecords() -> [PPDRecord] {
    // Try with Dataset/ prefix first, then fall back to root
    let candidates = [
        Bundle.main.url(forResource: "Dataset/PPD_database_export", withExtension: "json"),
        Bundle.main.url(forResource: "PPD_database_export", withExtension: "json")
    ]
 
    guard let url = candidates.compactMap({ $0 }).first else {
        print("PPDLoader ❌ Could not find PPD_database_export.json in bundle")
        return []
    }
 
    print("PPDLoader ✅ Found file at: \(url)")
 
    guard let data = try? Data(contentsOf: url) else {
        print("PPDLoader ❌ Could not read file data")
        return []
    }
 
    do {
        let records = try JSONDecoder().decode([PPDRecord].self, from: data)
        print("PPDLoader ✅ Loaded \(records.count) records")
        return records
    } catch {
        print("PPDLoader ❌ Decode error: \(error)")
        return []
    }
}
