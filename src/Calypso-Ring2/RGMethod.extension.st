Extension { #name : #RGMethod }

{ #category : #'*Calypso-Ring2' }
RGMethod >> astForStylingInCalypso [
	"this method simplified remote method styling. 
	Remote proxy will redefine it by building AST on client side"
	^self ast
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> calypsoEnvironmentType [
	^ClyMethod
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> hasPragmaNamed: aSymbol [
	^ self pragmas anySatisfy: [ :pragma | pragma selector = aSymbol ]
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> hasSelector: aSelector [ 
	"Answers true if the method refers to the selector"
	(self selector = aSelector) ifTrue: [ ^ true ].
	^ self sendsSelector: aSelector 
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> hasSelector: selector specialSelectorIndex: specialOrNil [

	^ self ast sentMessages includes: selector
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> implementors [

	^ #()
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> isDefinedInPackage: aPackage [

	^ self package = aPackage
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> literalAt: anIndex [

	^ self ast literals at: anIndex
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> messages [

	^ self ast sentMessages
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> origin [

	^ self parent
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> pragmas [

	^ self ast pragmas
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> readsRef: literalAssociation [ 
	"Answer whether the receiver loads the argument."
	^ self ast allChildren anySatisfy: [:each | 
		each isVariable and: [ each name = literalAssociation key ]]
	
	"self ast nodesDo: [ :node | 
		node isVariable and: [
			node parent isAssignment not and: [  
				(node binding =  literalAssociation)
					 		ifTrue: [^true]]]]. 
	^false"
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> readsSlot: aSlot [
	| nodes |
	nodes := self ast allChildren.
	nodes := nodes select: #isVariable.
	nodes := nodes select: #isInstance.
	nodes := nodes reject: [ :node | node parent isAssignment and: [ node parent variable = node ] ].
	^ nodes anySatisfy: [ :node | node binding slot == aSlot ]
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> sendNodes [
	^self ast sendNodes
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> sendsSelector: aSymbol [ 	
	"Answer whether the method sends a particular selector"
	^ self messages includes: aSymbol
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> variableNodes [
	^self ast variableNodes
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> writesRef: literalAssociation [ 
	"Answer whether the receiver stores into the argument."
	self ast nodesDo: [ :node | 
		node isVariable and: [
			node parent isAssignment and: [  
				(node parent variable = node) and: [  
					(node binding =  literalAssociation)
					 		ifTrue: [^true]]]]]. 
	^false
]

{ #category : #'*Calypso-Ring2' }
RGMethod >> writesSlot: aSlot [
	self ast nodesDo: [ :node | 
		node isVariable and: [
			node parent isAssignment and: [  
				(node parent variable = node) and: [  
					node isInstance and: [
						(node binding slot ==  aSlot)
					 		ifTrue: [^true]]]]]]. 
	^false
]
