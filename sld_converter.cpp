#include <bits/stdc++.h>
#include <cstdlib>
#define rep(i, n) for (lli i = 0; i < (n); i++)
#define rrep(i, n) for (lli i = (n)-1; i >= 0; i--)
using namespace std;
using lli = long long int;
bool isF(string s)
{
    rep(i, s.size()) if (s[i] == '.') return true;
    return false;
}
int main()
{
    string s;
    int cnt = 0;
    while (cin >> s) {
        unsigned int x;
        if (isF(s)) {
            float f = stof(s);
            x = *(unsigned*)&f;
        } else {
            int y = stoi(s);
            x = *(unsigned*)&y;
        }
        cout << ((x >> 24) & (0xff)) << endl;
        cout << ((x >> 16) & (0xff)) << endl;
        cout << ((x >> 8) & (0xff)) << endl;
        cout << ((x >> 0) & (0xff)) << endl;
    }
}
