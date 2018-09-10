Extension { #name : #FAMIXNamedEntity }

{ #category : #'*Famix-Java' }
FAMIXNamedEntity >> annotationInstanceNamed: anAnnotationName [
	^ self 
		annotationInstanceNamed: anAnnotationName 
		ifAbsent: [ ]
]

{ #category : #'*Famix-Java' }
FAMIXNamedEntity >> annotationInstanceNamed: anAnnotationName ifAbsent: aBlock [
	^ self annotationInstances 
		detect: [ :each | each annotationType name asSymbol = anAnnotationName asSymbol ]
		ifNone: aBlock
]

{ #category : #'*Famix-Java' }
FAMIXNamedEntity >> isAnnotated [
	^ self annotationInstances notEmpty
]

{ #category : #'*Famix-Java' }
FAMIXNamedEntity >> isAnnotatedWith: anAnnotationName [
	^ self annotationInstances contains: [ :each | each annotationType name asSymbol = anAnnotationName asSymbol ]
]
