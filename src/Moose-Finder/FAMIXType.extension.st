Extension { #name : #FAMIXType }

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderAttributesIn: composite [
	<moosePresentationOrder: 20>
	composite table
			title: 'Attributes';
			titleIcon: MooseIcons famixAttributeGroup;
			display: [ self attributes ];
			column: 'Name' evaluated: #name;
			column: 'Declared type' evaluated: [ :each | each declaredType gtDisplayString ];
			column: 'Modifiers' evaluated: [ '' ] tags: #modifiers;
			when: [ self attributes notEmpty ];
			selectionPopulate: #selection  
				entitled: 'Open declared type' 
				with:  [ :table | table selection declaredType ]
]

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Hierarchy';
			titleIcon: MooseIcons mooseSystemComplexity;
			initializeView: [ RTMondrian new ];
			painting: [ :b | self viewHierarchyOn: b ]
]

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderMethodsIn: composite [
	<moosePresentationOrder: 20>
	composite table
			title: 'Methods';
			titleIcon: MooseIcons famixMethodGroup;
			display: [ self methods ];
			column: 'Name' evaluated: #signature;
			column: 'Declared type' evaluated: [ :each | each declaredType gtDisplayString ];
			when: [ self methods notEmpty ];
			selectionPopulate: #selection  
				entitled: 'Open declared type' 
				with:  [ :table | table selection declaredType ]
]
