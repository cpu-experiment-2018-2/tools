#include <bits/stdc++.h>
#define rep(i, n) for (lli i = 0; i < (n); i++)
#define rrep(i, n) for (lli i = (n)-1; i >= 0; i--)
using namespace std;
using ui = unsigned int;
int main() {
  unsigned int s;
  int cnt = 0;
  ui val = 0;
  while (cin >> s) {
    val = s | (val << 8);
    cnt++;
    if (cnt % 4 == 0) {
      cout << *(int *)(&val);
    }
  }
}
