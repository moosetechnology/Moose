Extension { #name : #MooseObject }

{ #category : #'*Famix-Groups' }
MooseObject class >> relatedGroupType [
	" The entities can specify what is the prefered type of MooseGroup they want to be stored in.
	They do that using a class side method with uniqueName that contains pragma <mooseGroup>. 
	Because such methods are stored mostly in traits and a class can have more than prefered group
	type, the most specialize one selected."

	| definingMethods selectedMethods selectedMethod |
	definingMethods :=(Pragma allNamed: #mooseGroup from: self class to: Object) collect: #method.
	definingMethods ifEmpty: [ ^ MooseGroup ].

	"We need to find the most specialized method, so we select the lower in the hierarchy."
	selectedMethods := definingMethods groupedBy: [ :each | each methodClass withAllSuperclasses size ].
	selectedMethods := selectedMethods at: selectedMethods keys max.

	"In case multiple of such methods are found, we take the one that is the closest to be a local method. This means that if a method come from a trait of the class, it will be selected over a method that comes from a trait of a trait."
	selectedMethod := (selectedMethods sorted: [ :method1 :method2 | method1 origin allTraits includes: method2 origin ]) first.
	^ self perform: selectedMethod selector
]
