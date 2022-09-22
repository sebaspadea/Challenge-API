import Foundation

struct UserResponse: Decodable {
    let results: [User]?
}

struct User: Decodable {
    let name: FullName?
    let location: Adress?
    let city: String?
    let state: String?
    let country: String?
    let picture: Img?
}

struct FullName: Decodable {
    let title: String?
    let first: String?
    let last: String?
}

struct Adress: Decodable {
    let street: StreetName?
}

struct StreetName: Decodable {
    let number: Int?
    let name: String?
}

struct Img: Decodable {
    let medium: String?
}
