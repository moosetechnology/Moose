Trait {
	#name : #FmxMBRelationSideTrait,
	#category : #'Famix-MetamodelBuilder-Core-Traits'
}

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> *- aRelationSide [

	^ self manyToOne: aRelationSide
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> *-* aRelationSide [

	^ self manyToMany: aRelationSide
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> *-<> aRelationSide [

	^ self manyBelongTo: aRelationSide
	
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> - aRelationSide [

	^ self oneToOne: aRelationSide
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> -* aRelationSide [

	^ self oneToMany: aRelationSide
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> -<> aRelationSide [

	^ self oneBelongsTo: aRelationSide

	
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> <>- aRelationSide [

	^ self containsOne: aRelationSide
	
]

{ #category : #'relations - arrows' }
FmxMBRelationSideTrait >> <>-* aRelationSide [

	^ self containsMany: aRelationSide
	

	
]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> asRelationSideNamed: aPropertyName [

	<ignoreForCoverage>
	self explicitRequirement
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> containsMany: aRelationSide [

	| aRelation |
	
	aRelation := self oneToMany: aRelationSide.
	aRelation right container.
	self builder configuration navigationForContainers
		ifTrue: [ aRelation withNavigation ].
			
	^ aRelation
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> containsOne: aRelationSide [

	| aRelation |
	
	aRelation := self oneToOne: aRelationSide.
	aRelation right container.
	self builder configuration navigationForContainers
		ifTrue: [ aRelation withNavigation ].
			
	^ aRelation
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> manyBelongTo: aRelationSide [

	| aRelation |
	
	aRelation := self manyToOne: aRelationSide.
	aRelation left container.
	self builder configuration navigationForContainers
		ifTrue: [ aRelation withNavigation ].
			
	^ aRelation

]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> manyToMany: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName.
	ownSide many.
	ownSide derived.
	oppositeSide many.
	aRelation := self relationFrom: ownSide to: oppositeSide.
	self builder configuration navigationForNonContainers
		ifTrue: [ aRelation withNavigation ].

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].
	(self isRemote and: [ aRelationSide isRemote not ]) ifTrue: [ oppositeSide makeNonremote ].
	(self isRemote not and: [ aRelationSide isRemote ]) ifTrue: [ ownSide makeNonremote ].
		
	^ aRelation
	
	
]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> manyToOne: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide singularPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName.
	oppositeSide many.
	oppositeSide derived.
	aRelation := self relationFrom: ownSide to: oppositeSide.
	self builder configuration navigationForNonContainers
		ifTrue: [ aRelation withNavigation ].

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].
	(self isRemote and: [ aRelationSide isRemote not ]) ifTrue: [ oppositeSide makeNonremote ].
	(self isRemote not and: [ aRelationSide isRemote ]) ifTrue: [ ownSide makeNonremote ].
		
	^ aRelation
	
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> oneBelongsTo: aRelationSide [

	| aRelation |
	
	aRelation := self oneToOne: aRelationSide.
	aRelation left container.
	self builder configuration navigationForContainers
		ifTrue: [ aRelation withNavigation ].
			
	^ aRelation

]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> oneToMany: aRelationSide [

	| aRelation ownSide oppositeSide  |
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self singularPropertyName.
	ownSide many.
	ownSide derived.
	aRelation := self relationFrom: ownSide to: oppositeSide.
	self builder configuration navigationForNonContainers
		ifTrue: [ aRelation withNavigation ].
		
	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].
	(self isRemote and: [ aRelationSide isRemote not ]) ifTrue: [ oppositeSide makeNonremote ].
	(self isRemote not and: [ aRelationSide isRemote ]) ifTrue: [ ownSide makeNonremote ].		
		
	^ aRelation
	
	
]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> oneToOne: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide propertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self propertyName.
	oppositeSide derived.
	aRelation := self relationFrom: ownSide to: oppositeSide.
	self builder configuration navigationForNonContainers
		ifTrue: [ aRelation withNavigation ].
		
	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].
	(self isRemote and: [ aRelationSide isRemote not ]) ifTrue: [ oppositeSide makeNonremote ].
	(self isRemote not and: [ aRelationSide isRemote ]) ifTrue: [ ownSide makeNonremote ].
		
	^ aRelation
	
	
]

{ #category : #private }
FmxMBRelationSideTrait >> pluralPropertyName [

	self explicitRequirement
]

{ #category : #private }
FmxMBRelationSideTrait >> propertyName [

	^ self explicitRequirement
]

{ #category : #private }
FmxMBRelationSideTrait >> relationFrom: ownSide to: oppositeSide [

	| aRelation |
	
	aRelation := self builder newRelation
		side: ownSide;
		oppositeSide: oppositeSide;
		builder: self builder;
		yourself.	
			
	ownSide remoteBuilderDo: [ :aRemoteBuilder |
		aRemoteBuilder = self builder 
			ifFalse: [ aRemoteBuilder relations add: aRelation ] ].
		
	ownSide relation: aRelation.	
	oppositeSide relation: aRelation.

	ownSide relatedClass ifNotNil: [ 
		ownSide relatedClass addRelation: aRelation with: oppositeSide relatedEntity ].
		
	^ aRelation

]
