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

	self explicitRequirement
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> containsMany: aRelationSide [

	| aRelation |
	
	aRelation := self oneToMany: aRelationSide.
	aRelation right container.
			
	^ aRelation
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> containsOne: aRelationSide [

	| aRelation |
	
	aRelation := self oneToOne: aRelationSide.
	aRelation right container.
			
	^ aRelation
	
]

{ #category : #associations }
FmxMBRelationSideTrait >> link: link1 throughAssociation: anAssociationEntity link: link2 with: otherEntity [

"(behavior as: #TWithAccesses)
	link: #accesses -> #accessor
	throughAssociation: (access as: #TAccess) 
	link: #variable <- #icomingAcesses
	with: (variable as: #TAccessible)"
	
	| rel side1 side2 side3 side4 |
	rel := self subject builder newRelation
	from: [ :side |
		side1 := side name: (link1 value);
			relatedEntity: anAssociationEntity;
			one; 
			source	 ];
	to: [ :opposite |
		side2 := opposite name: link1 key;
			relatedEntity: self;
			many ].
			
	anAssociationEntity addRelation: rel with: self subject.		
			
	rel := self subject builder newRelation
		from: [ :side |
			side3 := side name: link2 value;
				relatedEntity: anAssociationEntity;
				one;
				target	 ];
		to: [ :opposite |
			side4 := opposite 	name: link2 key;
				relatedEntity: otherEntity;
				many ].
			
	anAssociationEntity addRelation: rel with: otherEntity subject.		
	
	^ { side1. side2. side3. side4 }

]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> manyBelongTo: aRelationSide [

	| aRelation |
	
	aRelation := self manyToOne: aRelationSide.
	aRelation left container.
			
	^ aRelation

]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> manyToMany: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName. 
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName. 	
	ownSide many.
	oppositeSide many.
	aRelation := self relationFrom: ownSide to: oppositeSide.
		
	^ aRelation
	
	
]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> manyToOne: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide singularPropertyName. 
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName. 	
	oppositeSide many.
	aRelation := self relationFrom: ownSide to: oppositeSide.
		
	^ aRelation
	
	
]

{ #category : #'relations - named containers' }
FmxMBRelationSideTrait >> oneBelongsTo: aRelationSide [

	| aRelation |
	
	aRelation := self oneToOne: aRelationSide.
	aRelation left container.
			
	^ aRelation

]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> oneToMany: aRelationSide [

	| aRelation ownSide oppositeSide  |
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName. 
	oppositeSide := aRelationSide asRelationSideNamed: self singularPropertyName. 	
	ownSide many.
	aRelation := self relationFrom: ownSide to: oppositeSide.
		
	^ aRelation
	
	
]

{ #category : #'relations - named' }
FmxMBRelationSideTrait >> oneToOne: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide propertyName. 
	oppositeSide := aRelationSide asRelationSideNamed: self propertyName.
	 	
	aRelation := self relationFrom: ownSide to: oppositeSide.
		
	^ aRelation
	
	
]

{ #category : #private }
FmxMBRelationSideTrait >> ownerPropertyName [

	^ self explicitRequirement
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

	ownSide relation: aRelation.	
	oppositeSide relation: aRelation.

	ownSide relatedClass ifNotNil: [ 
		ownSide relatedClass addRelation: aRelation with: oppositeSide relatedEntity ].
		
	^ aRelation

]
