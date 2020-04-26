struct RedditModel: Codable {
    let kind: String
    let data: RedditPostModel
}

struct RedditPostModel: Codable {
    let id: Int
    let name: String
    let age: Int
    let gender: String
    let category: String
    let imageSource: String
	let description: String
    let latitude: Int
    let longitude: Int
    var readed: Bool? = false
}
