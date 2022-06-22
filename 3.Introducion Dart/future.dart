Future<void> fetchNews() {
// Imagine that this function is fetching the news
// It has a delay of 2 seconds to represent the fetching
  return Future.delayed(
      const Duration(seconds: 2), () => print("News fetched"));
}

// Not async/await
// void main() {
//   fetchNews();
//   print('Fetching news...');
// }

// async/await
void main() async {
  await fetchNews();
  print('Fetching news...');
}
