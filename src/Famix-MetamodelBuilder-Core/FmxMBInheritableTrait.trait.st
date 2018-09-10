Trait {
	#name : #FmxMBInheritableTrait,
	#category : #'Famix-MetamodelBuilder-Core-Traits'
}

{ #category : #generalization }
FmxMBInheritableTrait >> --|> anObject [

	self generalization: anObject.
	^ anObject

]

{ #category : #generalization }
FmxMBInheritableTrait >> <|-- anObject [

	anObject generalization: self.
	^ anObject

]

{ #category : #'settings - default' }
FmxMBInheritableTrait >> defaultSuperclass [
	
	^ self builder environment basicSuperclass
]
