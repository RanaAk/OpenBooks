//
//  Book.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import Foundation

struct BookResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [Book]?
}

struct Book: Codable, Identifiable {
    let kind: String
    let id: String
    let etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
}

struct VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let readingModes: ReadingModes
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?
}

struct ReadingModes: Codable {
    let text: Bool
    let image: Bool
}

struct PanelizationSummary: Codable {
    let containsEpubBubbles: Bool
    let containsImageBubbles: Bool
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}

struct SaleInfo: Codable {
    let country: String?
    let saleability: String?
    let isEbook: Bool?
}

struct AccessInfo: Codable {
    let country: String?
    let viewability: String?
    let embeddable: Bool?
    let publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub: Epub?
    let pdf: Pdf?
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

struct Epub: Codable {
    let isAvailable: Bool?
}

struct Pdf: Codable {
    let isAvailable: Bool?
}

struct SearchInfo: Codable {
    let textSnippet: String?
}
