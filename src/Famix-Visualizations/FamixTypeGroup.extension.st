Extension { #name : #FamixTypeGroup }

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> blueprintComplexity [
	^ FamixTypeGroupBlueprintComplexity forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectorShowComplexity [

	<inspectorPresentationOrder: 10 title: 'System Complexity'>
	^ self systemComplexity asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectorShowNesting [

	<inspectorPresentationOrder: 10 title: 'Nesting'>
	^ self nesting asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectorShowUML [

	<inspectorPresentationOrder: 10 title: 'UML'>
	^ self uml asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> nesting [
	^ FamixTypeGroupNesting forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> systemAttraction [
	^ FamixTypeGroupSystemAttraction forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> systemComplexity [
	^ FamixTypeGroupSystemComplexity forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> uml [
	^ FamixTypeUML forTypeGroup: self
]
