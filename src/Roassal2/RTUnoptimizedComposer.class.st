Class {
	#name : #RTUnoptimizedComposer,
	#superclass : #RTComposer,
	#category : #'Roassal2-Builder-Composer'
}

{ #category : #'public-layout' }
RTUnoptimizedComposer >> group [
	^ self group: ('group', (mapping size asString)) asSymbol
]

{ #category : #'public-layout' }
RTUnoptimizedComposer >> group: aName [
	"Compute the group of added objects"
	| group |
	group := self newElementsAsGroup.
	groups add: group.
	mapping at: aName put: group.
]

{ #category : #accessing }
RTUnoptimizedComposer >> newElementsAsGroup [
	^ RTGroup withAll: (view elements copyWithoutAll: self allGroupedElements)
]
