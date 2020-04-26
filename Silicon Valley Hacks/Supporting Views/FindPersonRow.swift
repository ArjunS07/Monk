import SwiftUI

struct FindPersonRow: View {
       
    var user: User
    var body: some View {
        HStack {
            CircleImage(image: Image(user.imageSource))
                .frame(width: UIScreen.screenWidth / 4)
                .frame(maxHeight: 60)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(verbatim: user.name)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Text(verbatim: "\(user.age) year-old \(user.gender)")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .frame(width: 225, height: 70)
            Spacer()

    
        }
        
    }
}

struct FindPersonRow_Previews: PreviewProvider {

    static var previews: some View {
        FindPersonRow(user: User(name: "Arjun", description: "Lorem ipsum dolor", age: 20, category: "volunteer", languages: ["English", "Spanish"], gender: "male", latitude: 20, longitude: 20, id: 303933939))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
