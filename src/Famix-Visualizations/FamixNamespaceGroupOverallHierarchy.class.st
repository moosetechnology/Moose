"
I show namespaces names and their containment relations.
I show a group of namespaces and all the namespaces in their hierarchy.
Namespaces in the group are shown in black, namespace that are not in the group are shown in gray.
"
Class {
	#name : #FamixNamespaceGroupOverallHierarchy,
	#superclass : #FamixNamespaceGroupHierarchy,
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixNamespaceGroupOverallHierarchy class >> defaultTitle [
	^ 'Namespace group within overall hierarchy'
]

{ #category : #building }
FamixNamespaceGroupOverallHierarchy >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend
		text: 'Namespace in the selected group'
		withBoxColor: self colorForNamespaceInGroup.
	legend
		text: 'Namespace in the overall hierarchy'
		withBoxColor: self colorForNamespaceOutsideGroup.
	legend text: 'Edges show containment'.
	legend build
]

{ #category : #building }
FamixNamespaceGroupOverallHierarchy >> buildNodes [
	canvas
		addAll:
			((famixNamespaceGroup
				flatCollectAsSet: [ :namespace | namespace allWithScope: FamixTNamespace ])
				collect: [ :namespace | self shapeForNamespace: namespace ])
]

{ #category : #color }
FamixNamespaceGroupOverallHierarchy >> colorForNamespaceInGroup [
	^ Color black
]

{ #category : #color }
FamixNamespaceGroupOverallHierarchy >> colorForNamespaceOutsideGroup [
	^ Color gray
]

{ #category : #shapes }
FamixNamespaceGroupOverallHierarchy >> shapeForNamespace: namespace [
	^ (super shapeForNamespace: namespace)
		color:
			((famixNamespaceGroup includes: namespace)
				ifTrue: [ self colorForNamespaceInGroup ]
				ifFalse: [ self colorForNamespaceOutsideGroup ]);
		yourself
]
