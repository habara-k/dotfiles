#include <bits/stdc++.h>
using namespace std;
using LL = long long;

template<class T>bool chmax(T &a, const T &b) { if (a<b) { a=b; return 1; } return 0; }
template<class T>bool chmin(T &a, const T &b) { if (b<a) { a=b; return 1; } return 0; }


// std::vector Declaration
template<typename T>
vector<T> make_v(size_t a) { return vector<T>(a); }
template<typename T,typename... Ts>
auto make_v(size_t a,Ts... ts) {
   return vector<decltype(make_v<T>(ts...))>(a,make_v<T>(ts...));
}

// std::vector Initialization
template<typename T>
void fill_all(T& arr, const T& v) { arr = v; }
template<typename T, typename U>
void fill_all(T& arr, const U& v) { for (auto& i : arr) fill_all(i, v); }

// std::vector Debug
template<typename T>
ostream& operator<<(ostream& os, const vector<T>& v) {
   os << "[";
   bool a = 1;
   for (auto e : v ) {
      os << (a ? "" : " "); 
      os << e;
      a = 0;
   }
   os << "]";
   return os;
}

// std::pair Debug
template<typename T, typename U>
ostream& operator<<(ostream& os, const pair<T, U>& p) {
   os << "(" << p.first << " " << p.second << ")";
   return os;
}

// std::set Debug
template<typename T>
ostream& operator<<(ostream& os, const set<T>& st) {
   os << "{";
   bool a = 1;
   for (auto e : st) {
      os << (a ? "" : " ");
      os << e;
      a = 0;
   }
   os << "}";
   return os;
}

// std::multiset Debug
template<typename T>
ostream& operator<<(ostream& os, const multiset<T>& st) {
   os << "{";
   bool a = 1;
   for (auto e : st) {
      os << (a ? "" : " ");
      os << e;
      a = 0;
   }
   os << "}";
   return os;
}

// std::map Debug
template<typename T, typename U>
ostream& operator<<(ostream& os, const map<T, U>& mp) {
   os << "{";
   bool a = 1;
   for (auto e : mp) {
      os << (a ? "" : " ");
      os << e.first << ":" << e.second;
      a = 0;
   }
   os << "}";
   return os;
}

// std::tuple Debug
template<int N,class Tuple>
void out(ostream& os,const Tuple& t){}
template<int N,class Tuple,class H,class ...Ts>
void out(ostream& os,const Tuple& t){
   if(N)os<<" ";
   os<<get<N>(t);
   out<N+1,Tuple,Ts...>(os,t);
}
template<class ...Ts>
ostream& operator<<(ostream& os, const tuple<Ts...>& t){
   os<<"(";
   out<0,tuple<Ts...>,Ts...>(os,t);
   os<<")";
   return os;
}

// Debug
#define DUMP(x) cout<<#x<<" = "<<(x)<<endl


struct edge { int to, cost; };
ostream& operator<<(ostream& os, const edge& e) {
   os << "(" << e.to << ", " << e.cost << ")";
   return os;
}

const LL LINF = 1LL<<60;
const int IINF = 1<<30;
const LL MOD = 1e9+7;

int main()
{
   <+CURSOR+>

   return 0;
}
