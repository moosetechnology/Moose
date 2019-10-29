Class {
	#name : #FAMIXNamedEntity,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Moose-Query-Extensions' }
FAMIXNamedEntity class >> belongsToMethod [
	^ self compiledMethodAt: #belongsTo ifAbsent: nil
]

{ #category : #meta }
FAMIXNamedEntity class >> requirements [

	<generated>
	^ { FAMIXPackage }
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isAbstract [
	<FMProperty: #isAbstract type: #Boolean> <derived>
	<FMComment: 'Flag true for abstract entities. Language dependent.'>
	
	^ self modifiers includes: #abstract
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isFinal [
	<FMProperty: #isFinal type: #Boolean> <derived>
	<FMComment: 'Flag true for entities defined as being final. Language dependent.'>	

	^ self modifiers includes: #final
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isPackage [
	<FMProperty: #isPackage type: #Boolean> <derived>
	<FMComment: 'Flag true for entities that have a package visibility. Language dependent.'>
	
	^ self modifiers includes: #package
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isPrivate [
	<FMProperty: #isPrivate type: #Boolean> <derived>
	<FMComment: 'Flag true for entities invisible out of their owner scope. Language dependent.'>
	
	^ self modifiers includes: #private
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isProtected [
	<FMProperty: #isProtected type: #Boolean> <derived>
	<FMComment: 'Flag true for protected entities, depending on language semantics.'>
	
	^ self modifiers includes: #protected
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> isPublic [
	<FMProperty: #isPublic type: #Boolean> <derived>
	<FMComment: 'Flag true for entities accessible from anywhere. Language dependent.'>	

	^ self modifiers includes: #public
]

{ #category : #accessing }
FAMIXNamedEntity >> isStub [

	<FMProperty: #isStub type: #Boolean>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FAMIXNamedEntity >> modifiers [

	<FMProperty: #modifiers type: #String>
	<multivalued>
	<FMComment: 'Generic container for language dependent modifiers.'>
	^ modifiers ifNil: [ modifiers := Set new ]
]

{ #category : #metrics }
FAMIXNamedEntity >> numberOfAnnotationInstances [
	<FMProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<FMComment: 'The number of annotation instances defined in the class or in any of its methods'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [
			self annotationInstances size + (self methods inject: 0 into: [:sum :each | sum + each numberOfAnnotationInstances])]
]

{ #category : #accessing }
FAMIXNamedEntity >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
