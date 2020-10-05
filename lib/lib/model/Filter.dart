 abstract class Filter<T> {

     test(T element);

     List<T> select(List<T> elements) {
        List<T> filtered = [];
        for (T element in elements) {
            if (test(element)) {
                filtered.add(element);
            }
        }
        return filtered;
    }
}