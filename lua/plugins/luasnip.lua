-- LuaSnip configuration and custom C++ snippet
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    -- C++ template snippet
    ls.add_snippets("cpp", {
      s("cpp", {
        t({
          "/*",
          "     A man's dream will never die",
          "     Just Barely Glorious, but Glorious Indeed.",
          "     天上天下唯我獨尊",
          "     Throughout heaven and earth, I alone am the honored one",
          "     Nah, I'd win.",
          "     कर्मण्येवाधिकारस्ते मा फलेषु कदाचन",
          "",
          " */",
          "",
          "#include <bits/stdc++.h>",
          "",
          "using namespace std;",
          "",
          "#define int long long int",
          "#define F first",
          "#define S second",
          "#define pb push_back",
          "#define si set<int>",
          "#define vi vector<int>",
          "#define pii pair<int, int>",
          "#define vpi vector<pii>",
          "#define vpp vector<pair<int, pii>>",
          "#define mii map<int, int>",
          "#define mpi map<pii, int>",
          "#define spi set<pii>",
          "#define endl \"\\n\"",
          "#define sz(x) ((int)x.size())",
          "#define all(p) p.begin(), p.end()",
          "#define double long double",
          "#define que_max priority_queue<int>",
          "#define que_min priority_queue<int, vi, greater<int>>",
          "#define bug(...) __f(#__VA_ARGS__, __VA_ARGS__)",
          "#define print(a)                       \\",
          "    for (auto x : a) cout << x << \" \"; \\",
          "    cout << endl",
          "#define print1(a) \\",
          "    for (auto x : a) cout << x.F << \" \" << x.S << endl",
          "#define print2(a, x, y)                              \\",
          "    for (int i = x; i < y; i++) cout << a[i] << \" \"; \\",
          "    cout << endl",
          "",
          "inline int power(int a, int b) {",
          "    int x = 1;",
          "    while (b) {",
          "        if (b & 1) x *= a;",
          "        a *= a;",
          "        b >>= 1;",
          "    }",
          "    return x;",
          "}",
          "",
          "template <typename Arg1>",
          "void __f(const char* name, Arg1&& arg1) { cout << name << \" : \" << arg1 << endl; }",
          "template <typename Arg1, typename... Args>",
          "void __f(const char* names, Arg1&& arg1, Args&&... args) {",
          "    const char* comma = strchr(names + 1, ',');",
          "    cout.write(names, comma - names) << \" : \" << arg1 << \" | \";",
          "    __f(comma + 1, args...);",
          "}",
          "",
          "const int N = 200005;",
          "",
          "void solve() {",
          "    int n, m;",
          "    cin >> n >> m;",
          "    bug(n, m);",
          "}",
          "",
          "int32_t main() {",
          "    ios_base::sync_with_stdio(0);",
          "    cin.tie(0);",
          "    cout.tie(0);",
          "",
          "#ifndef ONLINE_JUDGE",
          "    freopen(\"input.txt\", \"r\", stdin);",
          "    freopen(\"output.txt\", \"w\", stdout);",
          "#endif",
          "",
          "    clock_t z = clock();",
          "",
          "    int t = 1;",
          "    // cin >> t;",
          "    while (t--) solve();",
          "",
          "    cerr << \"Run Time : \" << ((double)(clock() - z) / CLOCKS_PER_SEC);",
          "",
          "    return 0;",
          "}",
        }),
        i(0)
      })
    })

    -- Keymaps for snippet expansion and navigation
    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true, desc = "LuaSnip expand snippet (Ctrl+K)"})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true, desc = "LuaSnip jump forward"})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true, desc = "LuaSnip jump backward"})
    vim.keymap.set("i", "<leader><Tab>", function() ls.expand() end, {silent = true, desc = "LuaSnip expand snippet (<leader><Tab>)"})
  end,
  dependencies = {},
}
