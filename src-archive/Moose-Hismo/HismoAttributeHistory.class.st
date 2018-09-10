Class {
	#name : #HismoAttributeHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'containingClassHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoAttributeHistory class >> annotation [
	<MSEClass: #AttributeHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #accessing }
HismoAttributeHistory >> belongsTo [
	"return the classhistory it belongs to"
	
	containingClassHistory isNil
		ifTrue:
			[containingClassHistory := (self referenceHistory allClassHistories
				select:
					[:eachClass | eachClass hasUniqueName: self first versionEntity belongsTo mooseName])
				first].
	^containingClassHistory
]
