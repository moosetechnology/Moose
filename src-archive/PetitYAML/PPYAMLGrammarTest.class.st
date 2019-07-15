Class {
	#name : #PPYAMLGrammarTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'context'
	],
	#category : #PetitYAML
}

{ #category : #accessing }
PPYAMLGrammarTest >> context [
	^ context
]

{ #category : #parsing }
PPYAMLGrammarTest >> debug: aString rule: aSymbol [
	| production |
	production := self parserInstanceFor: aSymbol.
	
	debugResult := production end enableDebug parse: aString withContext: context.
	result := debugResult children first result.
	self
		deny: result isPetitFailure
		description: 'Unable to parse ' , aString printString.
	debugResult inspect.
	^ result
]

{ #category : #accessing }
PPYAMLGrammarTest >> parserClass [
	^ PPYAMLGrammar
]

{ #category : #running }
PPYAMLGrammarTest >> setUp [
	super setUp.
	context := PPContext new.
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testDocument [
	| string |
	string :='receipt:     Oz-Ware Purchase Invoice'.

	self parse: string rule: #l_bare_document.
	self assert: result size = 1.
	self assert: (result at: 'receipt') = 'Oz-Ware Purchase Invoice'
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testDocument1 [
	| string |
	string :='receipt:     Oz-Ware Purchase Invoice
date:        2012-08-06
customer:
    given:   Dorothy
    family:  Gale

items:
    - part_no:   A4786
      descrip:   Water Bucket (Filled)
      price:     1.47
      quantity:  4

    - part_no:   E1628
      descrip:   High Heeled "Ruby" Slippers
      size:      8
      price:     100.27
      quantity:  1
'.

	self parse: (string allButFirst:4) rule: #l_bare_document.
	self assert: result size = 4.
	self assert: ((result at: 'items') second at: 'price') = '100.27'.
	self assert: ((result at: 'items') first at: 'part_no') = 'A4786'
	
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testDocument2 [
	| string |
	string :='receipt:     Oz-Ware Purchase Invoice
date:        2012-08-06
customer:
    given:   Dorothy
    family:  Gale'.

	self parse: string rule: #start.
	self assert: result size = 3.
	self assert: ((result at: 'customer') at: #family) = 'Gale'
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testMappingClipStripKeep [
	| string |
	
	context YAMLN: -1.
	context YAMLContext: #'block-in'.
	string :=
'strip: >-

clip: >

keep: |+

'.

	self parse: string rule: #l_block_mapping.
	self assert: result size = 3.
	self assert: (result at: 'strip') = ''.
	self assert: (result at: 'clip') = ''.	
	self assert: (result at: 'keep') = String cr.
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testSequence [
	| string |
	context YAMLN: 1.
	string :=
' - { one : two , three: four , }
 - { five: six,seven : eight}'.

	self parse: string rule: #l_block_sequence.
	self assert: result size = 2.
	self assert: result first size = 2.
	self assert: result second size = 2.
	self assert: (result first at: 'three') = 'four'.
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testSequence2 [
	| string |
	string :=
' - [ a, b ]
 - { a: b }
 - "a"
 - c
'.

	self parse: string rule: #l_block_sequence.
	self assert: result size = 4.
]

{ #category : #'tests - complex' }
PPYAMLGrammarTest >> testTravisYml [
	| string |
	string :='language: c
sudo: false
cache:
  directories:
    - opensmalltalk-vm/.thirdparty-cache
git:
  depth: 5
addons:
  apt:
    packages:
      - debhelper
      - devscripts
      - libasound2-dev
      - libssl-dev
      - libfreetype6-dev
      - libx11-dev
      - libxext-dev
      - gcc-multilib
      - uuid-dev
      - zip
      # next ones are required for compiling libgit2
      - cmake
      - libssh2-1-dev
      - openssh-client
      - openssh-server
      - libtool
      - automake
      - autoconf
matrix:
  include:
    - os: osx
      env: ARCH="macos32x86" FLAVOR="pharo.cog.spur" SRC_ARCH="i386"
      after_deploy: 
        - ./scripts/deploy-after.sh
    - os: osx
      env: ARCH="macos64x64" FLAVOR="pharo.cog.spur" SRC_ARCH="x86_64"
    - os: linux
      env: ARCH="linux32x86" FLAVOR="pharo.cog.spur" SRC_ARCH="i386" HEARTBEAT="threaded"
      addons:
        apt:
          packages:
          - debhelper
          - devscripts
          - libc6-dev:i386
          - libasound2:i386
          - libasound2-dev:i386
          - libssl-dev:i386
          - libssl0.9.8:i386
          - libfreetype6-dev:i386
          - libx11-dev:i386
          - libsm-dev:i386
          - libice-dev:i386
          - libgl1-mesa-glx:i386
          - libgl1-mesa-dev:i386
          - libxext-dev:i386
          - libglapi-mesa:i386
          - gcc-multilib
          - uuid-dev:i386
    - os: linux
      env: ARCH="linux32x86" FLAVOR="pharo.cog.spur" SRC_ARCH="i386" HEARTBEAT="itimer"
      addons:
        apt:
          packages:
          - debhelper
          - devscripts
          - libc6-dev:i386
          - libasound2:i386
          - libasound2-dev:i386
          - libssl-dev:i386
          - libssl0.9.8:i386
          - libfreetype6-dev:i386
          - libx11-dev:i386
          - libsm-dev:i386
          - libice-dev:i386
          - libgl1-mesa-glx:i386
          - libgl1-mesa-dev:i386
          - libxext-dev:i386
          - libglapi-mesa:i386
          - gcc-multilib
          - uuid-dev:i386
    - os: linux
      env: ARCH="linux64x64" FLAVOR="pharo.cog.spur" SRC_ARCH="x86_64" HEARTBEAT="threaded"
    - os: linux
      env: ARCH="linux64x64" FLAVOR="pharo.cog.spur" SRC_ARCH="x86_64" HEARTBEAT="itimer"
    - os: linux
      sudo: required
      env: ARCH="linux32ARMv6" FLAVOR="pharo.cog.spur" SRC_ARCH="i386" CHROOT="schroot -p -c rpi
        -- bash -c "
      dist: trusty
      group: edge
      install:
        - (cd opensmalltalk-vm && ./.travis_install.sh)
script:
  - (echo $PATH)
  - (cd scripts && ./build-sources.sh -a $SRC_ARCH)
  - (cd scripts && ./build-makefile-linux.sh)
  - (cd opensmalltalk-vm && $CHROOT ./.travis_build.sh)
  - (cd scripts && ./pack-vm.sh -p $ARCH -a $SRC_ARCH)
  - ./scripts/run-tests.sh
before_deploy: 
  - (cd scripts && sh ./deploy-key.sh)
  - ./scripts/deploy-before.sh
deploy:
  - provider: bintray
    skip_cleanup: true
    file: .bintray.json
    user: $BINTRAY_USER
    key: $BINTRAY_API_KEY
    on:
      branch: master
      repo: pharo-project/pharo-vm
  - provider: script
    skip_cleanup: true
    script: ./scripts/deploy-files.pharo.org.sh
    on:
      branch: master
      repo: pharo-project/pharo-vm
'.

	self parse: string rule: #l_bare_document.
	self assert: result size = 9.
	

]

{ #category : #spec }
PPYAMLGrammarTest >> test_b_chomped_last [
	context YAMLChomp: #'strip'.
	self parse: '
' rule: #b_chomped_last.
	self assert: result = ''.
	
	context YAMLChomp: #'clip'.
	self parse: '
' rule: #b_chomped_last.
	self assert: result = String cr.
	
	context YAMLChomp: #'keep'.
	self parse: '
' rule: #b_chomped_last.
	self assert: result = String cr.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_b_l_folded [
	self parse: '
' rule: #b_l_folded.

	self assert: result = String space.

	self parse: '

' rule: #b_l_folded.
	self assert: result = String cr.
	
	self parse: '


' rule: #b_l_folded.
	self assert: result = (String cr, String cr).
]

{ #category : #spec }
PPYAMLGrammarTest >> test_b_l_trimmed [
	self parse: '

' rule: #b_l_trimmed.

	self assert: result = String cr.

	self parse: '


' rule: #b_l_trimmed.
	self assert: result = (String cr, String cr).
]

{ #category : #spec }
PPYAMLGrammarTest >> test_b_nb_literal_next [
	context YAMLContext: #'block-in'.
	context YAMLN: 3.
	
	self parse: '

  abc' rule: #b_nb_literal_next.
	self assert: result = (String cr, String cr, 'abc').
	
	self parse: '

   abc' rule: #b_nb_literal_next.
	self assert: result = (String cr, String cr, ' abc').
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_double_qouted [
	self parse: '"hi there"' rule: #c_double_quoted.
	self assert: result = 'hi there'.
	
	self parse: '" 1st non-empty

 2nd non-empty 
 3rd non-empty "' rule: #c_double_quoted.
	self assert: result = ' 1st non-empty
2nd non-empty 3rd non-empty '
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_flow_json_content [
	self parse: '"a"' rule: #c_flow_json_content.
	self assert: result = 'a'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_flow_mapping [
	self parse: '{ one : two , three: four , }' rule: #c_flow_mapping.
	self assert: result size = 2.
	self assert: (result at: 'one') = 'two'.
	self assert: (result at: 'three') = 'four'.
	
	self parse: '{ one: , ?:  }' rule: #c_flow_mapping.
	self assert: result size = 2.
	self assert: (result at: 'one') = nil.
	self assert: (result at: nil) = nil.

	self parse: '{ : omitted key  }' rule: #c_flow_mapping.
	self assert: result size = 1.
	self assert: (result at: nil) = 'omitted key'.

	
	self parse: '{
unquoted : "separate",
http://foo.com,
omitted value:,
: omitted key,
}' rule: #c_flow_mapping.
	self assert: result size = 4.
	self assert: (result at: 'unquoted') = 'separate'.
	self assert: (result at: 'http://foo.com') = nil.
	self assert: (result at: nil) = 'omitted key'.


	self parse: '{
"adjacent":value,
"readable": value,
"empty":
}'	rule: #c_flow_mapping.
	self assert: result size = 3.
	self assert: (result at: 'readable') = 'value'.	
	self assert: (result at: 'empty') = nil.	
	
	
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_flow_sequence [
	self parse: '[three ,four, five]' rule: #c_flow_sequence.
	self assert: result size = 3.
	self assert: result first = 'three'.
	self assert: result second = 'four'.
	self assert: result third = 'five'.
	
	
	self parse: '[ one, two, ]' rule: #c_flow_sequence.
	
	self assert: result size = 2.
	self assert: result first = 'one'.
	self assert: result second = 'two'.
	
	self parse: '[
foo: bar
]' rule: #c_flow_sequence.
	self assert: result size = 1.
	self assert: (result first at: 'foo') = 'bar'.
	
	self parse: '[
? foo
 bar : baz
]'	rule: #c_flow_sequence.
	self assert: result size = 1.
	self assert: (result first at: 'foo bar') = 'baz'.
	
	self parse: '[ foo, bar ]'	rule: #c_flow_sequence.
	self assert: result size = 2.
	self assert: result first = 'foo'.
	self assert: result second = 'bar'.
	
	self parse: '[ a, b ]'	rule: #c_flow_sequence.
	self assert: result size = 2.
	self assert: result first = 'a'.
	self assert: result second = 'b'
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_block_map_explicit_entry [
	context YAMLN: 1.
	context YAMLM: 1.
	context YAMLContext: #'block-in'.

	self parse: '? explicit key # Empty value
' rule: #c_l_block_map_explicit_entry.
	self assert: result key = 'explicit key'.
	self assert: result value = nil.
	

	self parse: '? |
  block key
: - one # Explicit compact
  - two # block value
' rule: #c_l_block_map_explicit_entry.
	self assert: result key = ('block key', String cr).
	self assert: result value size = 2.
	self assert: result value first = 'one'.
	self assert: result value second = 'two'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_block_map_explicit_key [
	context YAMLN: 1.
	context YAMLM: 1.
	context YAMLContext: #'block-in'.

	self parse: '? explicit key # Empty value
' rule: #c_l_block_map_explicit_key.
	self assert: result = 'explicit key'.
	
	self parse: '? |
  block key
' rule: #c_l_block_map_explicit_key.
	self assert: result = ('block key', String cr).
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_block_map_explicit_value [
	context YAMLN: 1.
	context YAMLM: 1.
	context YAMLContext: #'block-in'.

	self parse: ': - one # Explicit compact
  - two # block value
' rule: #l_block_map_explicit_value.
	self assert: result size = 2.
	self assert: result first = 'one'.
	self assert: result second = 'two'.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_block_map_implict_value [
	context YAMLContext: #'block-in'.
	self parse: ': in-line value' rule: #c_l_block_map_implicit_value.
	self assert: result  = 'in-line value'.


	context YAMLContext: #'block-in'.
	self parse: ':
- entry' rule: #c_l_block_map_implicit_value.
	self assert: result size = 1.
	self assert: result first = 'entry'.

	context YAMLContext: #'block-in'.
	self parse: ':
' rule: #c_l_block_map_implicit_value.
	self assert: result = nil.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_block_sequence_entry [
	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	context YAMLN: 1.
	self parse: '- one' rule: #c_l_block_seq_entry.
	self assert: result = 'one'.

	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	context YAMLN: 1.	
	self parse: '- two : three' rule: #c_l_block_seq_entry.
	self assert: (result at: 'two') = 'three'.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_folded [
	self parse: '>
 folded
 text
' rule: #c_l_folded.
	self assert: result = 'folded text
'.

	self parse: '>

 folded
 line

 next
 line
   * bullet

   * list
   * lines

 last
 line

# Comment' rule: #c_l_folded.

	self assert: result = '
folded line
next line
  * bullet

  * list
  * lines

last line
'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_literal [
	self parse: '|
 literal
  text
' rule: #c_l_literal.
	self assert: result = 'literal
 text
'.

	self parse: '|
 
  
  literal
   
  
  text

 # Comment' rule: #c_l_literal.
	self assert: result = '

literal
 

text
'
	
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_literal_chomping [
	self parse: '|-
  text
' rule: #c_l_literal.

	self assert: result = 'text'.
	
		self parse: '|
  text
' rule: #c_l_literal.

	self assert: result = ('text', String cr).


		self parse: '|+
  text
' rule: #c_l_literal.

	self assert: result = ('text', String cr).


]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_literal_failures [
	context YAMLContext: #'block-in'.
	"Should fail, but it does not, probably have to add some functionality to auto-detect"
	"
	self fail: '|
  
 text' rule: #c_l_literal.
	"
	
	self fail: '>
  text
 text' rule: #c_l_literal.

	self fail: '|2
 text' rule: #c_l_literal.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_c_l_literal_strip [
	self parse: '|-
  # text
  
 # Clip
  # comments:
' rule: #c_l_literal.

	self assert: result = '# text'
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_block_mapping [
	context YAMLN: -1.
	context YAMLContext: #'block-in'.
	self parse: 'block mapping:
 key: value
' rule: #l_block_mapping.

	self assert: result size = 1.
	self assert: ((result at: 'block mapping') at: 'key') = 'value'.
	
	context YAMLN: -1.
	context YAMLContext: #'block-in'.
	self parse: '? explicit key # Empty value
? |
  block key
: - one # Explicit compact
  - two # block value
' rule: #l_block_mapping.

	self assert: result size = 2.
	self assert: (result at: 'explicit key') = nil.
	self assert: (result at: ('block key', String cr)) size = 2.
	self assert: (result at: ('block key', String cr)) second = 'two'.
	
	context YAMLN: -1.
	context YAMLContext: #'block-in'.
	self parse: 'plain key: in-line value
: # Both empty
"quoted key":
- entry' rule: #l_block_mapping.

	self assert: result size = 3.
	self assert: (result at: nil) = nil.
	self assert: (result at: 'plain key') = 'in-line value'.
	self assert: (result at: 'quoted key') first = 'entry'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_block_sequence [
	context YAMLContext: #'block-in'.
	self parse: '  - foo
  - bar
  - baz' rule: #l_block_sequence.

	self assert: result size = 3.
	self assert: result first = 'foo'.
	self assert: result second = 'bar'.
	self assert: result third = 'baz'.

	self fail: '  - foo
 - bar' rule: #l_block_sequence.

	self parse: '  - foo
   - bar' rule: #l_block_sequence.
	self assert: result first = 'foo - bar'.
	
	context YAMLN: -1.
	context YAMLContext: #'block-in'.
	self parse: '- sun: yellow
- ? earth: blue
  : moon: white' rule: #l_block_sequence.

	self assert: result size = 2.
	self assert: (result first at: 'sun') = 'yellow'.
	self assert: (result second size = 1).
	self assert: (result second keys anyOne at:'earth') = 'blue'.
	self assert: (result second values anyOne at: 'moon') = 'white'.


]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_comment [
	self parse: ' # whatever' rule: #l_comment.
	self fail: '' rule: #l_comment.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_empty [
	self test_l_empty_blockIn.
	self test_l_empty_flowIn.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_empty_blockIn [
	context YAMLContext: #'block-in'.
	context YAMLN: 3.
	self parse: '  
' rule: #l_empty.
	self assert: result = String cr.


	self parse: '
' rule: #l_empty.
	self assert: result = String cr.

	self fail: '    
' rule: #l_empty.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_empty_flowIn [
	context YAMLContext: #'flow-in'.
	context YAMLN: 3.
	self parse: '   
' rule: #l_empty.
	self assert: result = String cr.


	self parse: '    
' rule: #l_empty.
	self assert: result = String cr.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_keep_empty [
	self parse: '
' rule: #l_keep_empty.
	self assert: result = String cr.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_nb_literal_text [
	context YAMLN: 3.
	context YAMLContext: #'block-in'.
	
	self parse: '  abc' rule: #l_nb_literal_text.
	self assert: result = 'abc'.
	
	self parse: '   abc' rule: #l_nb_literal_text.
	self assert: result = ' abc'.
	
	self parse: '  
  abc' rule: #l_nb_literal_text.
	self assert: result = (String cr, 'abc').

	self parse: '  
   abc' rule: #l_nb_literal_text.
	self assert: result = (String cr, ' abc').

	self parse: '  
   ' rule: #l_nb_literal_text.
	self assert: result = '
 '.

	self parse: ' 
  
  literal' rule: #l_nb_literal_text.
	self assert: result = (String cr, String cr, 'literal').
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_nb_literal_text_failures [
	context YAMLN: 3.
	context YAMLContext: #'block-in'.
	
	self fail: '  
   
  abc' rule: #l_nb_literal_text.

	self fail: '  
 abc' rule: #l_nb_literal_text.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_nb_literal_text_flowIn [
	context YAMLN: 3.
	context YAMLContext: #'flow-in'.
	
	self parse: '  abc' rule: #l_nb_literal_text.
	self assert: result = 'abc'.
	
	self parse: '  
   ' rule: #l_nb_literal_text.
	self assert: result = (String cr, ' ').
]

{ #category : #spec }
PPYAMLGrammarTest >> test_l_nb_spaced_lines [
	self parse: '   * bullet

   * list
   * lines' rule: #l_nb_spaced_lines.
	"TODO JK: add asserts"
]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_double_multi_line [
	self parse: 'hi there' rule: #nb_double_multi_line.
	self assert: result = 'hi there'.
	
	self parse: ' hi there  ' rule: #nb_double_multi_line.
	self assert: result = ' hi there  '.


	self parse: ' 1st non-empty

 2nd non-empty 
 3rd non-empty ' rule: #nb_double_multi_line.
	self assert: result = ' 1st non-empty
2nd non-empty 3rd non-empty ' 
]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_double_one_line [
	self parse: 'hi there' rule: #nb_double_one_line.
	
	self assert: result = 'hi there'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_double_qouted [
	self parse: '"hi there"' rule: #c_double_quoted.
	self assert: result = 'hi there'.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_double_text [
	self parse: 'hi there' rule: #nb_double_text.
	self assert: result = 'hi there'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_json [
	self parse: ' ' rule: #nb_json.
	self parse: 'a' rule: #nb_json.
	self fail: String cr rule: #nb_json.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_nb_ns_double_in_line [
	self parse: 'hi there' rule: #nb_ns_double_in_line.
	self assert: result = 'hi there'.
	
	self parse: ' hi there' rule: #nb_ns_double_in_line.
	self assert: result = ' hi there'.
	
	self fail: ' hi there ' rule: #nb_ns_double_in_line.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_map_entry [
	self parse: '? explicit: entry' rule: #ns_flow_map_entry.
	self assert: result = ('explicit' -> 'entry').
	
	self parse: '?' rule: #ns_flow_map_entry.
	self assert: result = (nil -> nil).
	
	self parse: 'implicit: entry' rule: #ns_flow_map_entry.
	self assert: result = ('implicit' -> 'entry').
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_map_explicit_entry [
	self parse: 'explicit: entry' rule: #ns_flow_map_explicit_entry.
	self assert: result = ('explicit' -> 'entry').
	
	self parse: '' rule: #ns_flow_map_explicit_entry.
	self assert: result = (nil -> nil).
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_map_implicit_entry [
	self parse: 'implicit: entry' rule: #ns_flow_map_implicit_entry.
	self assert: result = ('implicit' -> 'entry').
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_node [
	self parse: 'simple text' rule: #ns_flow_node.
	self assert: result = 'simple text'.
	
	self parse: 'simple 
	text' rule: #ns_flow_node.
	self assert: result = 'simple text'.
	
	self parse: '"double
 quoted"' rule: #ns_flow_node.
	self assert: result = 'double quoted'.
	
	self parse: 'plain
 text' rule: #ns_flow_node.
	self assert: result = 'plain text'.
	
	self parse: '[ nested ]' rule: #ns_flow_node.
	self assert: result size = 1.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_pair [
	self parse: 'single: pair' rule: #ns_flow_pair.
	
	self assert: result size = 1.
	self assert: (result at: 'single') = 'pair'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_flow_seq_entry [
	self parse: 'one' rule: #ns_flow_seq_entry.
	self assert: result = 'one'.
	
	self parse: '"one two"' rule: #ns_flow_seq_entry.
	self assert: result = 'one two'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_l_block_map_implicit_entry [
	self parse: 'foo: bar' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = 'foo'.
	self assert: result value = 'bar'.
	
	self parse: ': bar' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = nil.
	self assert: result value = 'bar'.
	
	self parse: ': #both empty' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = nil.
	self assert: result value = nil.
	
	self parse: 'foo: #value empty' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = 'foo'.
	self assert: result value = nil.
	
	self parse: 'plain key: in-line value' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = 'plain key'.
	self assert: result value = 'in-line value'.

	self parse: '"quoted key":
- entry' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = 'quoted key'.
	self assert: result value size = 1.
	self assert: result value first = 'entry'.


	self parse: ': #Both empty' rule: #ns_l_block_map_implicit_entry.
	self assert: result key = nil.
	self assert: result value = nil.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_l_compact_mapping [
	self parse: 'one: two # Compact mapping' rule: #ns_l_compact_mapping.
	self assert: result size = 1.
	self assert: (result at: 'one') = 'two'.
	
	
	self parse: 'one: two # Compact mapping
three: four' rule: #ns_l_compact_mapping.
	self assert: result size = 2.
	self assert: (result at: 'one') = 'two'.
	self assert: (result at: 'three') = 'four'.	
	
	context YAMLN: 3.
	self parse: 'one: two # Compact mapping
  three: four' rule: #ns_l_compact_mapping.
	self assert: result size = 2.
	self assert: (result at: 'one') = 'two'.
	self assert: (result at: 'three') = 'four'.	
	
	context YAMLN: 3.
	self fail: 'one: two # Compact mapping
three: four' rule: #ns_l_compact_mapping.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_l_compact_sequence [
	self parse: '- one
- two' rule: #ns_l_compact_sequence.
	self assert: result size = 2.
	self assert: result first = 'one'.
	self assert: result second = 'two'.

	context YAMLN: 3.	
	self parse: '- one
  - two
  - three' rule: #ns_l_compact_sequence.
	self assert: result size = 3.
	self assert: result first = 'one'.
	self assert: result second = 'two'.
	self assert: result third = 'three'.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain [
	context YAMLContext: #'flow-in'.
	self parse: 'a' rule: #ns_plain.
	self parse: 'foo' rule: #ns_plain.
	
	self fail: '-' rule: #ns_plain.
	
	"NOT Complete assertions..."
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain_char [
	self parse: 'a' rule: #ns_plain_char.

	self fail: '' rule: #ns_plain_char.
	self fail: ':' rule: #ns_plain_char.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain_multi_line [
	self parse: '1st non-empty

 2nd non-empty 
 3rd non-empty' rule: #ns_plain_multi_line.

	self assert: result = '1st non-empty
2nd non-empty 3rd non-empty'
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain_one_line [
	self parse: 'implicit block key' rule: #ns_plain_one_line.
	self assert: result = 'implicit block key'.
	
	self parse: 'implicit:entry' rule: #ns_plain_one_line.
	self assert: result = 'implicit:entry'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain_safe_in [
	self parse: 'a' rule: #ns_plain_safe_in.
	self parse: '+' rule: #ns_plain_safe_in.
	
	self fail: '{' rule: #ns_plain_safe_in.
	self fail: '}' rule: #ns_plain_safe_in.
	self fail: '[' rule: #ns_plain_safe_in.
	self fail: ',' rule: #ns_plain_safe_in.
	self fail: ' ' rule: #ns_plain_safe_in.
	self fail: String cr rule: #ns_plain_safe_in.
	

]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_plain_safe_out [
	self parse: 'a' rule: #ns_plain_safe_out.
	self parse: '+' rule: #ns_plain_safe_out.
	self parse: '{' rule: #ns_plain_safe_out.

	self fail: ' ' rule: #ns_plain_safe_out.
	self fail: String cr rule: #ns_plain_safe_out.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_s_flow_seq_entries [
	self parse: 'one, two' rule: #ns_s_flow_seq_entries.
	
	self assert: result size = 2.
	self assert: result first = 'one'.
	self assert: result second = 'two'.
	

	self parse: 'one, two, ' rule: #ns_s_flow_seq_entries.
	
	self assert: result size = 2.
	self assert: result first = 'one'.
	self assert: result second = 'two'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_ns_s_implicit_yaml_key [
	self parse: 'single ' rule: #ns_s_implicit_yaml_key.
	
	self assert: result = 'single'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_block_line_prefix [
	context YAMLN: 3.
	self parse: '  ' rule: #s_block_line_prefix.
	self assert: result = ''.
	
	self fail: '   ' rule: #s_block_line_prefix.
	
	self fail: ' ' rule: #s_block_line_prefix.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_double_next_line [
	self parse: '
 abc' rule: #s_double_next_line.
	self assert: result = ' abc'.
	
	self parse: '
 
  abc' rule: #s_double_next_line.
	self assert: result = '
abc'.

	self parse: '
 
  abc
  def' rule: #s_double_next_line.
	self assert: result = '
abc def'.

	self parse: '
 abc ' rule: #s_double_next_line.
	self assert: result = ' abc '.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_flow_folded [
	self parse: '
' rule: #s_flow_folded.

	self assert: result = String space.
	
	self parse: '
  
' rule: #s_flow_folded.
	self assert: result = String cr.

	self fail: '' rule: #s_flow_folded.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_flow_line_prefix [
	context YAMLN: 3.
	self parse: '  ' rule: #s_flow_line_prefix.
	self assert: result = ''.
	
	self parse: '   ' rule: #s_flow_line_prefix.
	self assert: result = ''.
	
	self parse: '    ' rule: #s_flow_line_prefix.
	self assert: result = ''.
	
	self fail: ' ' rule: #s_flow_line_prefix.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_indent [
	| s_indent p |

	s_indent := self parserInstance s_indent.
	s_indent name: 's_indent'.
	p := s_indent, 'a' asParser. 
	
	context YAMLN: 3.
	self assert: p parse: 
'  a'.

	self assert: p fail: 
' a'.

	self assert: p fail: 
'   a'.

	context YAMLN: 1.
	self assert: p parse: 
'a'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_indent_smaller [
	| s_indent p |

	s_indent := self parserInstance s_indent_smaller.
	s_indent name: 's_indent'.
	p := s_indent, 'a' asParser. 
	
	context YAMLN: 3.
	self assert: p parse: 
'  a'.

	self assert: p parse: 
' a'.

	self assert: p fail: 
'   a'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_block_collection [
	context YAMLContext: #'block-in'.
	
	self parse: '  - foo
  - bar' rule: #s_l_block_collection.
	self assert: result size = 2.
	
	context YAMLContext: #'block-in'.
	context YAMLN: -1.
	
	self parse: '- foo
- bar' rule: #s_l_block_collection.
	self assert: result size = 2.
	
	self parse: 'sequence:
- entry
- 
 - nested
mapping:
 foo: bar' rule: #s_l_block_collection.
	self assert: result size = 2.
	self assert: (result at: 'sequence') size = 2.
	self assert: (result at: 'sequence') first = 'entry'.
	self assert: (result at: 'sequence') second first = 'nested'.
	
	self assert: (result at: 'mapping') size = 1.
	self assert: ((result at: 'mapping') at: 'foo') = 'bar'.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_block_in_block [
	context YAMLContext: #'block-in'.

	self parse: '  >
 Block scalar
' rule: #s_l_block_in_block.
	self assert: result = ('Block scalar', String cr).
	
	context YAMLContext: #'block-in'.
	self parse: '  #block collection
  foo: bar 	
' rule: #s_l_block_in_block.
	self assert: (result at: 'foo') = 'bar'.

	context YAMLContext: #'block-in'.
	context YAMLN: -1.
	self parse: '
- entry' rule: #s_l_block_in_block.
	self assert: result first = 'entry'.


]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_block_indented [
	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	self parse: ' foo' rule: #s_l_block_indented.
	self assert: result = 'foo'.
	
	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	self parse: 'foo' rule: #s_l_block_indented.
	self assert: result = 'foo'.
	
	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	context YAMLN: -1.
	self parse: 'foo: bar' rule: #s_l_block_indented.
	self assert: (result at: 'foo') = 'bar'.
	
	context YAMLContext: #'block-in'.
	context YAMLM: 3.
	self parse: '  foo: bar' rule: #s_l_block_indented.
	self assert: (result at: 'foo') = 'bar'.
	
	context YAMLContext: #'block-in'.
	context YAMLM: 1.
	self parse: '  - foo
  - bar' rule: #s_l_block_indented.
	self assert: result first = 'foo'.
	self assert: result second = 'bar'.	
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_block_indented_sequence [
	context YAMLContext: #'block-in'.
	context YAMLM: 3.
	context YAMLN: 1.

	"This should be handled by compact sequence"
	self parse: '   - foo
   - bar' rule: #s_l_block_indented.

	self assert: result first = 'foo'.
	self assert: result second = 'bar'.	
	
	context YAMLM: 2.
	context YAMLN: 3.

	"This should be handled by compact sequence"
	self parse: '     - foo
     - bar' rule: #s_l_block_indented.

	self assert: result size = 2.
	self assert: result first = 'foo'.
	self assert: result second = 'bar'.	
	

	context YAMLM: 1.
	context YAMLN: -1.

	self parse: '- - foo
  - bar' rule: #s_l_block_indented.

	self assert: result size = 1.
	self assert: result first size = 2.
	
	context YAMLM: 2.
	context YAMLN: -1.

	self parse: ' -  - foo
    - bar' rule: #s_l_block_indented.

	self assert: result size = 1.
	self assert: result first size = 2.
	
	
	self fail: '-  - foo
  - bar' rule: #s_l_block_indented.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_block_node [
	context YAMLContext: #'block-in'.
	context YAMLN: -1.

	self parse: '-
  "flow in block"
- >
 Block scalar
- foo : bar
' rule: #s_l_block_node.
	self assert: result size = 3.
	
	self assert: result first = 'flow in block'.
	self assert: result second = ('Block scalar', String cr).
	self assert: (result third at: 'foo') = 'bar'.
	
	
	context YAMLContext: #'block-in'.
	context YAMLN: -1.
	self parse: 'literal: |2
  value
folded:
   >1
 value' rule: #s_l_block_node.
	self assert: result size = 2.
	self assert: (result at: 'literal') = ('value', String cr).
	self assert: (result at: 'folded') = 'value'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_l_flow_in_block [
	context YAMLN: 3.

	self parse: '  "flow in block"' rule: #s_l_flow_in_block.
	self assert: result = 'flow in block'.
	
	self parse: '   hi there' rule: #s_l_flow_in_block.
	self assert: result = 'hi there'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_nb_spaced_text [
	self parse: '   * bullet' rule: #s_nb_spaced_text.
	self assert: result = '   * bullet'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_ns_plain_next_line [
	self parse: '
 abc' rule: #s_ns_plain_next_line.
	self assert: result = ' abc'.
	
	self parse: '
 
  abc' rule: #s_ns_plain_next_line.
	self assert: result = '
abc'.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_separate [
	self parse: ' ' rule: #s_separate.
	self parse: '   ' rule: #s_separate.

]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_separate_in_line [
	self parse: ' ' rule: #s_separate_in_line.
	self assert: result = ' '.
	self parse: '   ' rule: #s_separate_in_line	.
	self assert: result = '   '.
]

{ #category : #spec }
PPYAMLGrammarTest >> test_s_separate_lines [
	self parse: ' ' rule: #s_separate_lines.
	self parse: '   ' rule: #s_separate_lines.	
]
