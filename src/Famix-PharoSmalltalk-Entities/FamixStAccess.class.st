Class {
	#name : #FamixStAccess,
	#superclass : #FamixStAssociation,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAccess class >> annotation [

	<MSEClass: #Access super: #FamixStAssociation>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixStAccess >> mooseFinderSourceTextIn: composite [
	<moosePresentationOrder: 20>
	composite text
			title: 'Source';
			titleIcon: MooseIcons mooseSourceText;
			when: [ self from notNil and: [self from sourceText notEmpty ]];
			format: [ self from formattedSourceText ]
]

{ #category : #printing }
FamixStAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]
