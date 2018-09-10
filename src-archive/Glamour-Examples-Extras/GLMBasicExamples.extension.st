Extension { #name : #GLMBasicExamples }

{ #category : #'*Glamour-Examples-Extras' }
GLMBasicExamples >> magritte [
	<glmBrowser: 'Magritte presentation' input: 'GLMMagrittePersonExample sampleData'>
	"self new magritte openOn: GLMMagrittePersonExample sampleData"
	"GLMMagrittePersonExample sampleReset"  
	"note, sampleData is aGLMAnnouncingCollection"
	
	| browser |
			
	browser := GLMTabulator new initialExtent: 600@300.
	browser column: #list; column: #detail.
	browser transmit to: #list ; andShow: [ :a | 
		a list
			title: 'Contacts';
			format: [ :person | person name ] ;
			updateOn: GLMItemAdded from: [ GLMMagrittePersonExample sampleData ] ;
			updateOn: GLMItemRemoved from: [ GLMMagrittePersonExample sampleData ] ;
			updateOn: GLMItemChanged from: [ GLMMagrittePersonExample sampleData ] ;
			act: [ :listPresentation :glmAC | 
					| newItem | 
					newItem := GLMMagrittePersonExample new name: 'New...'  .
					glmAC add: newItem beforeOrLast: listPresentation selection.
					listPresentation selection: newItem.
				]	icon: GLMUIThemeExtraIcons glamorousAdd 
					entitled: 'Add' ;
			act: [ :listPresentation :glmAC | 
					glmAC remove: listPresentation selection ifAbsent: []
				]	icon: GLMUIThemeExtraIcons glamorousRemove 
					entitled: 'Remove' .
	].

	browser transmit from: #list ; to: #detail ; andShow: [ :a | 
		a magritte
			title: 'Details';
			description: [:person | person magritteDescription] ;
			onAnswer: [ :person :presentation | 
				"browser update -- this works only if the current broser is not embedded in any other browser." 
				GLMMagrittePersonExample sampleData announce: GLMItemChanged ] . 
	].

	^ browser
]
