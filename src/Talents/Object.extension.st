Extension { #name : #Object }

{ #category : #'*Talents' }
Object >> addTalent: aTalent [
	^ TalentInstaller uniqueInstance addTalent: aTalent toObject:self.
	
]

{ #category : #'*Talents' }
Object >> copyWithTalent: aClass [
	^ TalentInstaller uniqueInstance copyObject: self withTalent: aClass
]

{ #category : #'*Talents' }
Object >> copyWithoutTalent: aClass [
	^ TalentInstaller uniqueInstance
		copyObject: self
		withoutTalent: aClass
]

{ #category : #'*Talents' }
Object >> removeTalent: aTalent [
	^ TalentInstaller uniqueInstance removeTalent: aTalent fromObject:self.
	
]
