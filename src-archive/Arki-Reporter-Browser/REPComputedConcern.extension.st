Extension { #name : #REPComputedConcern }

{ #category : #'*Arki-Reporter-Browser' }
REPComputedConcern >> gtActionSpawnResult [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | composite selection: self result ];
		icon: GLMUIThemeExtraIcons glamorousPlay;
		title: 'Result'
]
