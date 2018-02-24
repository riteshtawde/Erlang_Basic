-module(geometry1).
-export([area/1,test/0,perimeter/1]).

area({rectangle,Width,Height})->Width*Height;
area({circle,Radius})->3.1415*Radius*Radius;
area({righttr,Base,Height})->0.5*Base*Height.

perimeter({rectangle,Width,Height})->2*(Width+Height).

test()->
	12=area({rectangle,4,3}),
	50.264=area({circle,4}),
	25.0=area({righttr,5,10}),
	14=perimeter({rectangle,4,3}),
	test_passed.