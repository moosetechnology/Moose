Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfAssociations [
	<FMProperty: #numberOfAssociations type: #Number>
	<FMComment: 'The total number of associations'>
	^ self numberOfEntityUsing: FamixTAssociation
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfEntities [
	<FMProperty: #numberOfEntities type: #Number>
	<FMComment: 'The total number of entities (items that are not associations)'>
	^ self numberOfItems - self numberOfAssociations
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of classes in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self allMethods sum: #numberOfLinesOfCode ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfPackages [
	<FMProperty: #numberOfPackages type: #Number>
	<FMComment: 'Total number of packages'>
	^ self privateState propertyAt: #numberOfPackages ifAbsentPut: [ self numberOfEntityUsing: FamixTPackage ] 
]
