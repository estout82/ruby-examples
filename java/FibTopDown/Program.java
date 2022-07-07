public class Program {
  public static void main(String args[]) {
    Program program = new Program();

    System.out.println(
      Integer.toString(program.fib(10))
    );
  }

  public int fib(int n) {
    return fib(n, new int[n + 1]);
  }

  private int fib(int n, int[] memo) {
    if (n == 0 || n == 1) return n;

    if (memo[n] == 0) { // I guess arrays are initialized to 0 by default in Java
      memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
    }

    return memo[n];
  }
}
