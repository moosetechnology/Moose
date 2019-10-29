Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity - {#mooseNameOn:} + FamixTEnumValue',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTEnumValue classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<FMClass: #EnumValue super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaEnumValue class >> requirements [

	<generated>
	^ { FamixJavaEnum }
]

{ #category : #accessing }
FamixJavaEnumValue >> accessors [
	<FMProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #accessing }
FamixJavaEnumValue >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses of an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [self incomingAccesses size]
]

{ #category : #accessing }
FamixJavaEnumValue >> numberOfAccessingClasses [
	<FMProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes from which at least one method accesses an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccessingClasses
		computedAs: [self accessingClasses size]
]

{ #category : #accessing }
FamixJavaEnumValue >> numberOfAccessingMethods [
	<FMProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods accessing an attribute.'>				
	
	^self
		lookUpPropertyNamed: #numberOfAccessingMethods
		computedAs: [self accessingMethods size]
]

{ #category : #accessing }
FamixJavaEnumValue >> numberOfGlobalAccesses [
	<FMProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>	

	^self
		lookUpPropertyNamed: #numberOfGlobalAccesses
		computedAs: [self globalAccesses size]
]

{ #category : #accessing }
FamixJavaEnumValue >> numberOfLocalAccesses [
	<FMProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
		
	^self
		lookUpPropertyNamed: #numberOfLocalAccesses
		computedAs: [self localAccesses size]
]
