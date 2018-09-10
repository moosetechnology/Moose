Extension { #name : #SettingTreeBuilder }

{ #category : #'*Moose-Settings' }
SettingTreeBuilder >> moosesettings [
	<settingPragmaProcessor>
	currentPragma methodClass theNonMetaClass
		perform: currentPragma methodSelector
		with: self
]
