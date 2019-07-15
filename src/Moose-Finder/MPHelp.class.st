Class {
	#name : #MPHelp,
	#superclass : #MoosePanelCommand,
	#category : #'Moose-Finder'
}

{ #category : #accessing }
MPHelp >> category [

	^ 'Meta'
]

{ #category : #execution }
MPHelp >> execute [
	| browser |
	browser := GLMTabulator new.
	browser title: 'Moose helper'.
	browser act: [:b | b update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Refresh'.
	browser column: #index; column: #contents span: 2.
	browser transmit to: #index; andShow: [:a |
		a tree 
			title: 'Index';
			display: #asHelpTopic;
			children: #subtopics;
			rootsExpanded;
			icon: #icon;
			format: #title ].
	browser transmit from: #index; to: #contents; andShow: [:a | 
		a text 
			title: 'Contents';
			display: #contents ].
	^ browser openOn: MooseHelp
]

{ #category : #execution }
MPHelp >> icon [
	^ GLMUIThemeExtraIcons glamorousHelp
]

{ #category : #accessing }
MPHelp >> label [

	^ 'Moose Help'
]
