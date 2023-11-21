import SwiftUI

struct ForumView: View {
    @StateObject var vl = ForumViewModel()

    @State private var showNewTweetview = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(vl.posts) { post in
                        EarthWiseRowView(author: post.category, iduser: post.description)
                            .padding()
                    }
                }
            }
            .onAppear {
                vl.getAllposts()
            }

            Button {
                showNewTweetview.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemGreen))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetview) {
                AddPostView()
            }
        }
    }
}

struct EarthWiseRowView: View {
    @State var author: String
    @State var iduser: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemGreen))
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(author)
                            .font(.subheadline).bold()
                        Text(iduser)
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2W")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
            }
            HStack {
                Button {

                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }

                Spacer()

                Button {

                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                Spacer()

                Button {

                } label: {
                    Image(systemName: "text.bubble")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                Spacer()

                Button {

                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
            }
            .padding()
            .foregroundColor(.gray)

            Divider()
        }
    }
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
