import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String

    public init(name: String) {
        self.name = name
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        guard let url = Bundle.main.url(forResource: name, withExtension: "gif"),
              let data = try? Data(contentsOf: url)
        else {
            return webView
        }

        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )

        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage(name: "car").frame(width: 150, height: 50)

            
    }
}
