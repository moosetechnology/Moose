Class {
	#name : #HismoMethodHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'containingClassHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoMethodHistory class >> annotation [
	<MSEClass: #MethodHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'public interface' }
HismoMethodHistory >> accessControlQualifierVersions [
	
	^self collect: [:each | each accessControlQualifier]
]

{ #category : #'public interface' }
HismoMethodHistory >> becamePublic [
	
	^self accessControlQualifierVersions first ~= #public
		& (self accessControlQualifierVersions last = #public)
]

{ #category : #accessing }
HismoMethodHistory >> belongsTo [
	"return the classhistory it belongs to"
	
	containingClassHistory isNil
		ifTrue:
			[containingClassHistory := (self referenceHistory allClassHistories
				select:
					[:eachClass | eachClass hasUniqueName: self first versionEntity belongsTo mooseName])
				first].
	^containingClassHistory
]

{ #category : #'public interface' }
HismoMethodHistory >> signature [
	"returns the unique name of the history"
	
	| uName |
	uName := #''.
	self isEmpty ifFalse: [uName := self first signature].
	^uName
]
