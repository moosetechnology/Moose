Extension { #name : #RGPackageDefinition }

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> asPackageName [

	^ self name
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> calypsoEnvironmentType [
	^RPackage
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> classTags [

	self isRingResolved not ifTrue: [ ^ '' ].
	
	 ^ self classes collect: [:aClass | (aClass category ifNil: [ '' ]) withoutPrefix: (self name, '-')] as: Set
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> classesForClassTag: aTag [

	^ self classes select: [ :each | each category  = aTag or: [ each category = (self packageName, '-', aTag) ] ]
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> extendedClassNames [

	^ self extendedClasses collect: #name
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> extendsClass: aClass [

	^ self extendedClasses includes: aClass.
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> extensionSelectorsForClass: aClass [

	^ (self extensionMethods select: [ :each | each parent = aClass ]) collect: #name
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> importClasses: classCollection [
	classCollection do: [ :each | 
		each package: self. ]
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> includesClassesAffectedBy: aSystemAnnouncement [

	^(aSystemAnnouncement affectsClassesDefinedInPackage: self)
		or: [ aSystemAnnouncement affectsClassesExtendedInPackage: self ]
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> isAboutPackage: aPackage [

	^self == aPackage
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> isEmpty [

	^ self definedClasses isEmpty and: [ self extensionMethods isEmpty ]
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> packageManifestOrNil [

	^ nil "TODO"
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> packageName [

	^ self name
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> removeFromSystem [

	self environment removePackage: self.
]

{ #category : #'*Calypso-Ring2' }
RGPackageDefinition >> renameTo: aString [

	self name: aString
]
