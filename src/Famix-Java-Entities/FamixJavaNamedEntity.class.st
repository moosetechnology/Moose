Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTHasModifiers + FamixTInvocationsReceiver + FamixTNamedEntity + FamixTPackageable + FamixTWithAnnotationInstances',
	#classTraits : 'FamixTHasModifiers classTrait + FamixTInvocationsReceiver classTrait + FamixTNamedEntity classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
