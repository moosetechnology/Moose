"
=-=-=-=-
| b ds deco |

b := RTGrapher new.

ds := RTData new.
ds points: #(0 1 2 3 4 5 6).
b add: ds.

deco :=  RTHorizontalAllValuesDecorator new.
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

deco :=  RTVerticalValuesDecorator new.
deco addAll: #(2 3 4).
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

b axisX noTick; noLabel.
b axisY noTick; noLabel.
b
=-=-=-=-
"
Class {
	#name : #RTVerticalValuesDecorator,
	#superclass : #RTAbstractVerticalValuesDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}
