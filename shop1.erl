-module(shop1).
-export([cost/1,total/1]).

cost(apples)->5;
cost(oranges)->4;
cost(bananas)->2;
cost(mangoes)->10;
cost(melons)->8;
cost(_)->0.
  
total([{What,Num}|T])->cost(What)*Num+total(T);
total([])->0.