public class Program {
  public static void main(String[] args) {
    Program program = new Program();

    int result = program.fib(10);

    System.out.print(result);
  }

  public int fib(int n) {
    int a = 0;
    int b = 1;
    int c = 0;

    for (int i = 0; i < n; i++) {
      if (i == 0 || i == 1) {
        c = i;
        continue;
      }

      c = a + b;

      a = b;
      b = c;
    }

    return a + b;
  }
}
