abstract class Extractor {

   setRequestProperty(String key, String value);

   setRetryOnFailure(int retryOnFailure);

    extractYtPlayerConfig(String html);

   String extractYtInitialData(String html);

   Future<String> loadUrl(String url);

}