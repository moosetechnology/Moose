Extension { #name : #FAMIXType }

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderAttributesIn: composite [
	<moosePresentationOrder: 20>
	composite table
		title: 'Attributes';
		titleIcon: MooseIcons famixAttributeGroup;
		display: [ self attributes ];
		column: 'Name' evaluated: #name;
		column: 'Declared type' evaluated: [ :each | each declaredType displayString ];
		column: 'Modifiers' evaluated: [ '' ] tags: #modifiers;
		when: [ self attributes isNotEmpty ];
		selectionPopulate: #selection entitled: 'Open declared type' with: [ :table | table selection declaredType ]
]

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderMethodsIn: composite [
	<moosePresentationOrder: 20>
	composite table
		title: 'Methods';
		titleIcon: MooseIcons famixMethodGroup;
		display: [ self methods ];
		column: 'Name' evaluated: #signature;
		column: 'Declared type' evaluated: [ :each | each declaredType displayString ];
		when: [ self methods isNotEmpty ];
		selectionPopulate: #selection entitled: 'Open declared type' with: [ :table | table selection declaredType ]
]
