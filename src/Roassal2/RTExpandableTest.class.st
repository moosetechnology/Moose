Class {
	#name : #RTExpandableTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTExpandableTest >> testBasic [

	| v s e es expand |
	v := RTView new.
	s := RTBox new width: [ :c | c numberOfVariables * 5 ]; height: #numberOfMethods.
	e := s elementOn: RTComposer.
	
	expand := (RTExpandable new
					group: [ :group :element | 
						es := (RTBox new color: Color red) elementsOn: element model rtmethods.
						RTGridLayout on: es.
						group addAll: es]).
	e @ expand. 
	v add: e.
	
	self assert: v numberOfElements equals: 1.
	self deny: (expand hasElementBeenExpended: e).
	self deny: (expand isSelected: e).
	expand clickOn: e.
	self assert: (expand isSelected: e).
	self assert: (expand hasElementBeenExpended: e).
	self assert: v numberOfElements equals: 1 + RTComposer rtmethods size.

	expand clickOn: e.
	self deny: (expand isSelected: e).
	self assert: v numberOfElements equals: 1.
]

{ #category : #tests }
RTExpandableTest >> testMultipleSelection [

	| v es expandable |
	v := RTView new.

	es := (RTBox new size: 30) elementsOn: #(1 2).
	es @ RTPopup.

	expandable := RTExpandable new
				group: [:group :el | 
					group add: ((RTBox new color: Color red) elementOn: 1).
					];
				afterBlock: [ RTHorizontalLineLayout on: es ].
	es @ expandable.

	v add: es.
	RTHorizontalLineLayout on: es.
	
	expandable clickOn: es first.
	"Position of the red inner node is the same than the first encapsulating node"
	self assert: es first position equals: v elements last position.	
	
	expandable clickOn: es first.
	expandable clickOn: es first.
	
	self assert: v numberOfElements equals: 3.
	
	"Position of the red inner node is the same than the first encapsulating node"
	self assert: es first position equals: v elements last position.	

]
