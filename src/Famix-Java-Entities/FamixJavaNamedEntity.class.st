Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaNamedEntity class >> requirements [

	<generated>
	^ { FamixJavaPackage }
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isAbstract [
	<FMProperty: #isAbstract type: #Boolean> <derived>
	<FMComment: 'Flag true for abstract entities. Language dependent.'>
	
	^ self modifiers includes: #abstract
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isFinal [
	<FMProperty: #isFinal type: #Boolean> <derived>
	<FMComment: 'Flag true for entities defined as being final. Language dependent.'>	

	^ self modifiers includes: #final
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isPackage [
	<FMProperty: #isPackage type: #Boolean> <derived>
	<FMComment: 'Flag true for entities that have a package visibility. Language dependent.'>
	
	^ self modifiers includes: #package
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isPrivate [
	<FMProperty: #isPrivate type: #Boolean> <derived>
	<FMComment: 'Flag true for entities invisible out of their owner scope. Language dependent.'>
	
	^ self modifiers includes: #private
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isProtected [
	<FMProperty: #isProtected type: #Boolean> <derived>
	<FMComment: 'Flag true for protected entities, depending on language semantics.'>
	
	^ self modifiers includes: #protected
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> isPublic [
	<FMProperty: #isPublic type: #Boolean> <derived>
	<FMComment: 'Flag true for entities accessible from anywhere. Language dependent.'>	

	^ self modifiers includes: #public
]

{ #category : #accessing }
FamixJavaNamedEntity >> isStub [

	<FMProperty: #isStub type: #Boolean>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FamixJavaNamedEntity >> modifiers [

	<FMProperty: #modifiers type: #String>
	<multivalued>
	<FMComment: 'Generic container for language dependent modifiers.'>
	^ modifiers ifNil: [ modifiers := Set new ]
]

{ #category : #metrics }
FamixJavaNamedEntity >> numberOfAnnotationInstances [
	<FMProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<FMComment: 'The number of annotation instances defined in the class or in any of its methods'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [
			self annotationInstances size + (self methods inject: 0 into: [:sum :each | sum + each numberOfAnnotationInstances])]
]

{ #category : #accessing }
FamixJavaNamedEntity >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
