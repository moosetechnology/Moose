Class {
	#name : #HismoPackageHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'classHistories',
		'packageHistories',
		'containingPackageHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoPackageHistory class >> annotation [
	<MSEClass: #PackageHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #accessing }
HismoPackageHistory >> classHistories [
	classHistories isNil ifTrue: 
		[ classHistories := self referenceHistory allClassHistories select: [ :each | each parentPackage = self ] ].
	^ classHistories
]

{ #category : #accessing }
HismoPackageHistory >> packageHistories [
	packageHistories isNil ifTrue: 
		[ packageHistories := self referenceHistory allPackageHistories select: [ :each | each parentPackage = self ] ].
	^ packageHistories
]

{ #category : #accessing }
HismoPackageHistory >> packagedIn [
	
	self deprecated: 'Call parentPackage instead of packagedIn'.
	^ self parentPackage
]

{ #category : #accessing }
HismoPackageHistory >> parentPackage [
	"return the packagehistory it is packaged in"
	^ containingPackageHistory ifNil: 
		[ self first versionEntity parentPackage isNil 
			ifFalse: 
				[ containingPackageHistory := (self referenceHistory allPackageHistories select: 
					[ :eachClass | 
					eachClass hasUniqueName: self first versionEntity parentPackage historicalUniqueName ]) first ]
			ifTrue: [ nil ] ]
]
