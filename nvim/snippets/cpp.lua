local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cpp-cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "#define ll long long",
      "#define mod 1000000007",
      "",
      "void solve() {",
      "  ",
      "}",
      "",
      "int main() {",
      "  ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);",
      "  ll test=1;",
      "  // cin>>test;",
      "  while(test--) {",
      "    solve();",
      "  }",
      "  return 0;",
      "}"
    })
  })
}

