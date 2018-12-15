float float_of_int(int x) { return (float)x; }
int int_of_float(float y) { return (int)y; }
// <========= https://github.com/kw-udon/ucc/blob/master/lib/libm.c
float kernel_cos(float x) {
  float a1, a2, a3, a4;

  a1 = 0.5000000f;
  a2 = 0.0833333f;
  a3 = 0.0333333f;
  a4 = 0.0178571f;

  return (1 -
          a1 * x * x * (1 - a2 * x * x * (1 - a3 * x * x * (1 - a4 * x * x))));
}
float kernel_sin(float x) {
  float a1, a2, a3, a4;

  a1 = 0.1666667;
  a2 = 0.0500000;
  a3 = 0.0238095;
  a4 = 0.0138888;

  return x * (1 - a1 * x * x *
                      (1 - a2 * x * x * (1 - a3 * x * x * (1 - a4 * x * x))));
}
// ==========>


 int* mymalloc(int x) {
  int *p = (int *)1;
  int tmp = p[0];
  p[0] += x;
  return (int*)tmp;
}
int* create_tuple(int x) {
  return mymalloc(x);
}
int*create_array_sub(int a, int b){
  int *c = (int *)mymalloc(a);
  for (int i = 0; i < a; ++i) {
    c[i] = b;
  }
  return c;
}
int*create_array(int a, int b) {
  if(b==0) return mymalloc(a);
  else return create_array_sub(a,b);
}
