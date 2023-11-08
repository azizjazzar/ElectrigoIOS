//
//  NewsDetailView.swift
//  Electrigo
//
//  Created by idriss EB on 8/11/2023.
//


import SwiftUI

struct NewsItem {
    var title: String
    var content: String
    var date: String
    var imageName: String
}

struct NewsView: View {
    var newsItems: [NewsItem] // Remplissez cette liste avec vos actualités

    var body: some View {
        NavigationView {
            List(newsItems, id: \.title) { newsItem in
                NavigationLink(destination: NewsDetailView(newsItem: newsItem)) {
                    NewsItemView(newsItem: newsItem)
                }
            }
            .navigationBarTitle("Actualités sur les Voitures Électriques")
        }
    }
}

struct NewsItemView: View {
    var newsItem: NewsItem

    var body: some View {
        HStack {
            Image(newsItem.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(newsItem.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(newsItem.date)
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(newsItem.content)
                    .font(.subheadline)
                    .lineLimit(3)
            }
        }
    }
}

struct NewsDetailView: View {
    var newsItem: NewsItem

    var body: some View {
        ScrollView {
            VStack {
                Image(newsItem.imageName)
                    .resizable()
                    .frame(height: 200)
                    .aspectRatio(contentMode: .fill)

                Text(newsItem.title)
                    .font(.title)
                    .padding()

                Text(newsItem.date)
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(newsItem.content)
                    .font(.body)
                    .padding()
            }
        }
        .navigationBarTitle("Détails de l'Actualité")
    }
}

