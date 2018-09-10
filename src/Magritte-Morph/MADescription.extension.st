Extension { #name : #MADescription }

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphClass [
	^ self defaultMorphClasses notEmpty
		ifTrue: [ self defaultMorphClasses first ]
]

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphClasses [
	^ Array new
]

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphColor [
	^ Color white
]

{ #category : #'*Magritte-Morph' }
MADescription >> descriptionMorphClass [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #morphClass;
		label: 'Morph Class';
		priority: 2000;
		reference: MAClassDescription new;
		options: self class defaultMorphClasses;
		default: self class defaultMorphClass;
		yourself
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphClass [
	^ self propertyAt: #morphClass ifAbsent: [ self class defaultMorphClass ]
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphClass: aClass [
	^ self propertyAt: #morphClass put: aClass
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphColor [
	^ self propertyAt: #morphColor ifAbsent: [ self class defaultMorphColor ]
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphColor: aColor [
	^ self propertyAt: #morphColor put: aColor
]
