Extension { #name : #Class }

{ #category : #'*Talents' }
Class >> addTrait: aClass [ 
	
	^ TalentInstaller uniqueInstance addTrait: aClass toClass: self.
]

{ #category : #'*Talents' }
Class >> copyWithTrait: aClass [
	^ TalentInstaller uniqueInstance copyClass: self withTrait: aClass
]
