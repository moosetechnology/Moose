Extension { #name : #FAMIXContainerEntity }

{ #category : #'*Famix-Java' }
FAMIXContainerEntity >> definedAnnotationTypes [
	<MSEProperty: #definedAnnotationTypes type: #FamixAnnotationType opposite: #container>
	<multivalued>
	<derived>
	<MSEComment: 'The container in which the AnnotationTypes may be declared'>
	<package: #Java>
	
	^ self privateState attributeAt: #definedAnnotationTypes ifAbsentPut: [ FMMultivalueLink on: self opposite: #container: ]
]

{ #category : #'*Famix-Java' }
FAMIXContainerEntity >> definedAnnotationTypes: aValue [
	Halt if: [ aValue class = OrderedCollection ].
	self privateState attributeAt: #definedAnnotationTypes put: aValue
]

{ #category : #'*Famix-Java' }
FAMIXContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]
