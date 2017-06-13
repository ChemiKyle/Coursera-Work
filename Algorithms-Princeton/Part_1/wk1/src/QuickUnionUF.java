/**
 * Created by kyle on 6/13/17.
 */
public class QuickUnionUF {
    private int[] id;

//    Initialize by setting each object's ID to itself
    public QuickUnionUF(int N) {
        id = new int[N];
        for (int i= 0; i < N; i++) {
            id[i] = i;
        }
    }

//    Find top level parent (root) of tree
    private int root(int i) {
        while (i != id[i]) {
            i = id[i];
        }
        return i;
    }

    public boolean connected(int p, int q) {
        return root(p) == root(q);
    }

//    Set root of p to root of q
    public void union(int p, int q) {
        int i = root(p);
        int j = root(q);
        id[i] = j;
    }


}
