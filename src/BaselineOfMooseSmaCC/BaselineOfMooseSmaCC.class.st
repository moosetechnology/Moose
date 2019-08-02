"
This baseline claims SmaCC packages, and it direct dependancies. extracted from the original baseline.
proposing several configurations: java, c#, javascript, etc.



"
Class {
	#name : #BaselineOfMooseSmaCC,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseSmaCC
}

{ #category : #baselines }
BaselineOfMooseSmaCC >> baseline: spec [
	<baseline>
	
	" Common to all distros "
	spec	
	  	package: 'SmaCC_Runtime';
	  	package: 'SmaCC_Rewrite_Engine' with: [ spec requires: 'SmaCC_Runtime'; requires: 'SmaCC_Source_Editing' ];
		package: 'SmaCC_Rewrite_Engine_Tests' with: [ spec requires: 'SmaCC_Rewrite_Engine' ];
   	  	package: 'SmaCC_Smalltalk_Parser' with: [ spec requires: 'SmaCC_Runtime' ]; 
	  	package: 'SmaCC_Antlr_Parser' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_CSV_Parser' with: [ spec requires: 'SmaCC_Runtime' ];
		package: 'SmaCC_CSharp' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_C_Parser' with: [ spec requires: 'SmaCC_Runtime' ];
		package: 'SmaCC_Delphi' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_Delphi_Forms' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_GLR_Runtime' with: [ spec requires: 'SmaCC_Runtime' ];
		package: 'SmaCC_Generic_Smalltalk_Parser' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_Grammar_Parser' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_Java' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_Javascript_Parser' with: [ spec requires: 'SmaCC_GLR_Runtime' ];
		package: 'SmaCC_Line_Parser' with: [ spec requires: 'SmaCC_Runtime' ];
		package: 'SmaCC_Smalltalk_Parser' with: [ spec requires: 'SmaCC_Runtime' ];
		package: 'SmaCC_Source_Editing';
		package: 'SmaCC_Swift' with: [ spec requires: 'SmaCC_GLR_Runtime' ].
		spec
				group: 'Runtime' with: #('SmaCC_Runtime');
				group: 'GLR Runtime' with: #('SmaCC_GLR_Runtime');
				group: 'Rewrites' with: #('SmaCC_Rewrite_Engine');
				group: 'C#' with: #('SmaCC_CSharp');
				group: 'Delphi' with: #('SmaCC_Delphi' 'SmaCC_Delphi_Forms');
				group: 'Java' with: #('SmaCC_Java');
				group: 'Javascript' with: #('SmaCC_Javascript_Parser').
	" Pharo specific  "	
	spec
				package: 'SmaCC_Development'
					with: [ spec
						requires: 'SmaCC_GLR_Runtime';
						requires: 'SmaCC_Grammar_Parser' ];
				package: 'SmaCC_Debugging_Support'
					with: [ spec
						requires: 'SmaCC_Development';
						requires: 'SmaCC_Runtime' ];
				package: 'SmaCC_Development_UI' with: [ spec requires: 'SmaCC_Development' ];
				package: 'SmaCC_Parse_Tree_Comparison' with: [ spec requires: 'SmaCC_Runtime' ];
				package: 'SmaCC_Rewrite_Engine_Command_Line' with: [ spec requires: 'SmaCC_Rewrite_Engine' ];
				package: 'SmaCC_Rewrite_Engine_UI' with: [ spec requires: 'SmaCC_Rewrite_Engine' ];
				package: 'SmaCC_Rewrite_Server';
				package: 'SmaCC_Rewrite_Server_Worker' with: [ spec requires: 'SmaCC_Rewrite_Engine' ];
				package: 'SmaCC_Tests' with: [ spec requires: 'SmaCC_Development' ];
				group: 'UI' with: #(SmaCC_Development_UI SmaCC_Rewrite_Engine_UI);
				group: 'FullNoUI'
					with: 	#('SmaCC_CSV_Parser' 'SmaCC_CSharp' 'SmaCC_C_Parser' 'SmaCC_Development' 'SmaCC_Debugging_Support' 'SmaCC_Delphi' 'SmaCC_Delphi_Forms' 
						      'SmaCC_Generic_Smalltalk_Parser' 'SmaCC_Java' 'SmaCC_Javascript_Parser' 'SmaCC_Line_Parser' 'SmaCC_Parse_Tree_Comparison' 
						     'SmaCC_Rewrite_Engine_Command_Line' 'SmaCC_Rewrite_Engine_Tests'  'SmaCC_Rewrite_Server' 'SmaCC_Rewrite_Server_Worker' 
						     'SmaCC_Smalltalk_Parser' 'SmaCC_Source_Editing' 'SmaCC_Swift' 'SmaCC_Tests' 'SmaCC_Antlr_Parser');
				group: 'FullUI'
					with: 	#(FullNoUI UI);
				group: 'Tests' with: #('SmaCC_Rewrite_Engine_Tests' 'SmaCC_Tests');
            	group: 'Development' with: #('SmaCC_Development_UI').
		

]
