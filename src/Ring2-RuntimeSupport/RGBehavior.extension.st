Extension { #name : #RGBehavior }

{ #category : #'*Ring2-RuntimeSupport' }
RGBehavior >> allSuperclasses [

	| temp |
	^ ((self superclass == nil) or: [ self superclass == self ])
		ifTrue: [ OrderedCollection new]
		ifFalse: [temp := self superclass allSuperclasses.
			temp addFirst: self superclass.
			temp] 
]

{ #category : #'*Ring2-RuntimeSupport' }
RGBehavior >> binding [

	^ self environment bindingOf: self name
]

{ #category : #'*Ring2-RuntimeSupport' }
RGBehavior >> classPool [

	^ Dictionary new.
]
