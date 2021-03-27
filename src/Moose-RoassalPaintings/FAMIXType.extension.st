Extension { #name : #FAMIXType }

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> abstractMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isAbstract
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> abstractMethodsGroup [
	<navigation: 'Abstract methods'>
	^ FamixMethodGroup withAll: self abstractMethods withDescription: 'Abstract methods in ' , self name
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> accessorMethodsGroup [
	<navigation: 'Accessor methods'>
	^ FamixMethodGroup withAll: self accessorMethods withDescription: 'Pure accessors in ' , self name
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> constantMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isConstant
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> constructors [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isConstructor
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> externalFanin [

	^ self clientClassesOutOfMyPackage size
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> externalFanout [

	^ self providerClassesOutOfMyPackage size
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> fanRatio [

	^ self fanIn / (self fanIn + self fanOut)
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> fanTotal [

	^ self fanIn + self fanOut
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> fanType [

	^ self externalFanin >= self internalFanin
			ifTrue: [
				self externalFanout >= self internalFanout
					ifTrue: [#eFieFo]
					ifFalse: [#eFiiFo]]
			ifFalse: [
				self externalFanout >= self internalFanout
					ifTrue: [#iFieFo]
					ifFalse: [#iFiiFo]]
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> faninBalance [

	| fanin |
	fanin := self fanIn.
	^ fanin = 0 	ifTrue: [0]
					ifFalse: [(self externalFanin - self internalFanin) / self fanIn]
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> fanoutBalance [

	^ (self externalFanout - self internalFanout) / self fanOut
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> getterMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isGetter
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXType >> hierarchyVisualization [

	| hierarchy |
	hierarchy := (self withDeepCollect: [ :each | each directSubclasses ])
	             , (self deepCollect: [ :each | 
			              each directSuperclasses reject: [ :c | c isInterface ] ]).
	^ FamixTypeGroupSystemComplexity forTypeGroup:
		  hierarchy asMooseSpecializedGroup
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> internalFanin [

	^ self clientClassesIntoMyPackage size
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> internalFanout [

	^ self providerClassesIntoMyPackage size
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> internalInvocations [

	^ self outgoingInvocationsGroup select: [:each | 
				each candidates anySatisfy: [:c|
					c belongsTo == self ]].

]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> internalLayerInvocations [

	^ self outgoingInvocationsGroup select: [:each | 
			each sender isInternalImplementation and: [ "internal sender"
				each candidates anySatisfy: [:cand|
					cand belongsTo == self and: [ "class candidate"
						each sender ~= cand and: [ "no recursive call"
							cand isInternalImplementation ]]]]] "internal candidate"

]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> overridingMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isOverriding
]

{ #category : #'*Moose-RoassalPaintings-Support' }
FAMIXType >> setterMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isSetter
]
