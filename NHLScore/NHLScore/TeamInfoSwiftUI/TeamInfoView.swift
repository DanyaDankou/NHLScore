//
//  TeamInfoView.swift
//  NHLScore
//
//  Created by comp on 12.03.23.
//

import SwiftUI

struct TeamInfoView: View {
    
    let teamInfo: Team

    var body: some View {
        
        VStack {
            Text(teamInfo.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 10)
            
            
            UserImage(url: getLogoURL(for: teamInfo.id)!)
        
        }
    }

    
struct UserImage: View {
    
    let url: URL
    
    var body: some View {
        getLogo(from: url)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
}
    

private func getLogo(from url: URL) -> Image {
    guard let imageData = try? Data(contentsOf: url),
          let image = UIImage(data: imageData) else { return
          Image(systemName: "xmark.shield") }
    return Image(uiImage: image)
}
}
}

//struct TeamInfoView_Previews: PreviewProvider {
//    static var previews: some View {

//    }
//}

