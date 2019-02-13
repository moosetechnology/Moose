"
Add ticks at particular values:

-=-=-=-=-=-=-=-=-=-=-=-=
c := (1 to: 100) collect: [ :i | 50 atRandom @ 50 atRandom ].

g := RTGrapher new.
d := RTData new.
d points: c.
d x: #x.
d y: #y.
g add: d.
g axisX noTick.
g axisY noTick.

g addDecorator: (RTVerticalValuesDecorator new addAll: #(10 25)).
g addDecorator: (RTHorizontalValuesDecorator new addAll: #(10 25)).
g
-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTHorizontalValuesDecorator,
	#superclass : #RTAbstractHorizontalValuesDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}
