Extension { #name : #RGBehavior }

{ #category : #'*Famix-MetamodelBuilder-Core' }
RGBehavior >> dependsOn: anotherBehavior [

	(self allSuperclasses includes: anotherBehavior) ifTrue: [ ^ true ].
	
	((self withAllSuperclasses flatCollect: [:each | each traitComposition traits]) includes: anotherBehavior) ifTrue: [ ^ true ].
	
	^ false	
]
