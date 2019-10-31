Trait {
	#name : #FamixTWithAnnotationInstances,
	#instVars : [
		'#annotationInstances => FMMany type: #FamixTAnnotationInstance opposite: #annotatedEntity'
	],
	#category : #'Famix-Traits-AnnotationInstance'
}

{ #category : #meta }
FamixTWithAnnotationInstances classSide >> annotation [

	<FMClass: #TWithAnnotationInstances super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithAnnotationInstances >> addAnnotationInstance: anAnnotationInstance [
	annotationInstances add: anAnnotationInstance
]

{ #category : #'Famix-Java' }
FamixTWithAnnotationInstances >> allAnnotationInstances [
	| result |
	result := OrderedCollection new.
	result addAll: self annotationInstances.
	result addAll: (self methods flatCollect: [ :each | each annotationInstances ]).
	^ result 
]

{ #category : #'Famix-Java' }
FamixTWithAnnotationInstances >> annotationInstanceNamed: anAnnotationName [
	^ self 
		annotationInstanceNamed: anAnnotationName 
		ifAbsent: [ ]
]

{ #category : #'Famix-Java' }
FamixTWithAnnotationInstances >> annotationInstanceNamed: anAnnotationName ifAbsent: aBlock [
	^ self annotationInstances 
		detect: [ :each | each annotationType name asSymbol = anAnnotationName asSymbol ]
		ifNone: aBlock
]

{ #category : #accessing }
FamixTWithAnnotationInstances >> annotationInstances [
	"Relation named: #annotationInstances type: #FamixTAnnotationInstance opposite: #annotatedEntity"

	<generated>
	<FMComment: 'This property corresponds to the set of annotations associated to the entity'>
	<derived>
	^ annotationInstances
]

{ #category : #accessing }
FamixTWithAnnotationInstances >> annotationInstances: anObject [

	<generated>
	annotationInstances value: anObject
]

{ #category : #accessing }
FamixTWithAnnotationInstances >> annotationTypes [
	^ self annotationInstances collectAsSet: [:each | each annotationType ]

]

{ #category : #'Famix-Java' }
FamixTWithAnnotationInstances >> isAnnotated [
	^ self annotationInstances notEmpty
]

{ #category : #'Famix-Java' }
FamixTWithAnnotationInstances >> isAnnotatedWith: anAnnotationName [
	^ self annotationInstances contains: [ :each | each annotationType name asSymbol = anAnnotationName asSymbol ]
]

{ #category : #metrics }
FamixTWithAnnotationInstances >> numberOfAnnotationInstances [
	<FMProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<FMComment: 'The number of annotation instances defined in the class or in any of its methods'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [
			self annotationInstances size + (self methods inject: 0 into: [:sum :each | sum + each numberOfAnnotationInstances])]
]

{ #category : #metrics }
FamixTWithAnnotationInstances >> numberOfAnnotationInstances: aNumber [

	self privateState propertyAt: #numberOfAnnotationInstances put: aNumber
]
