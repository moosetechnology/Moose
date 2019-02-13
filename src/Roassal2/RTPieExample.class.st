"
RTPieExample new installTitle: 'GroupOfGroups' 
		code:
		'
v canvas'
	
"
Class {
	#name : #RTPieExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-PieChart'
}

{ #category : #sources }
RTPieExample >> exampleEmphasis [

	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	b slice: #numberOfMethods.
	b normalizer distinctColor.	
	b labeled.
	b emphasize: Set by: 20.
	b emphasize: Dictionary by: 20.
	^ b 
]

{ #category : #icons }
RTPieExample >> exampleEmphasisIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFf0lEQVR4XuXc608iVxgGcP/Z
bfof9Eu/NOkHXXU13abZdmvamGZ3Y6tdhfWyWqQKIiCiIIosCMhVYVguA3J9p/OeLjReUIHp
KjxP8obLECLnx8w5M+fgkKLg5zFlCL8J8EHwgw+CD4IffBB8EPzgg+CD4AcfBB8EP/gg+MEH
wQfBDz4IPgh+8EHwQfCDD4IPgh98EPzgg+CD4AcfBB8EP/gg+CD4wQe5KSWng3Jv5yg9Maa0
re8mSN78m6rxGLV7n9ngIXHwQbpIQ5Ypr5u/HaFNpSbGqGS3Xmr45Yifxt0WhSsi5wgfpIN0
C3G1ZKNBNHyxVm1hNMuXlQgf5I5UE3FKT45rgpF6Ntpq8Fd+9zWQf1HShA/SJpVwSBOIZpWP
DkVjnxaylzDGHBvK6PZfytON5Ud1+Bp6XBhhTTEyP//YauTvPbZLICOrOmXctaWMrMwrT41L
4jYWi1EoFCKj0UiBQIDcbjcFg0Fx3+l0UjQaJRiQWjKhKQYXvye/976UvHaoYpDh+RlleHFO
GVnTKyPri8qb7U3R+AaDgQ4PD8nv95Ner6f19XXxN5pMJhwQrfqMZmVnZ1qNd1O/0a5SF8Ub
G71UKlGxWMQAyesXNN87qFajq8Pc+9RrteOH7kMackFzjMJ6+2HufeohTxofHCS38FZzkLuG
uXeV5SzS/yA8QnG5XOKD+Hw+cZ87xt3dXSoUChSPx2l2dpYikQjt7OyQJEm0v7+vOUa7YW4n
9cuxs/9B7Ha7+BDqiIS8Xq8A4YbnYSQj8DaLxUIOh0Pc5+32jQ1NQaSXL9oOczutgThkVatV
0SCVSoUajQbx43q9Lp7jx7VPHW3zNjf/p6Yg1UT7YS4kSMdDXS2HuX90N8xtVzX1C4QP0ssw
99PeuRY7ocmD7Z4rVynjg/Q6zB2EDATIIGUgQHy76jB706X0UgdbB/hXe7UCqZQrPYN82PuA
D6LlISvii/SEkggm8EHSzydJyz5EbdiuUc4j5/ggsmlDM5BUVEf5TL5rkEa9gQ9SOz/XDMRr
faI2apm4L+gCBH9OvRleqqMVSNgzQvVavWOQZCiJD9JMyWbVDIRLznqIO+hOQPDPQ67uJc9G
SSsQr/UL8W13m9z3Qon5Y/jrsq6mEjzpCUS9pExe65fUREmGXlMhW6B+6jseFQiHr9Z2C1LP
Zsnv/Ir+20ueKLVqjgKugEAxL5sV3YyuBbE2vyZu5Zx8DYQnznjJT/Px6ekpQYJwMlMvu0Kp
RqMU8gxfAgm6vyVqkAAx6o0C4N3v75S5V3PKzPSMsrq4KibReNJsaWmJNtTJMm785mQar8my
2Wxi1nNvb08sB+LXZDIZsfqEn7NarWLC7ejoiAYShBcXSD887xil7D2iqO/FJRCufMZJfMJn
0BnEXrG5tCnKZrKJhufJs3N16M3TzxcXF5RKpSgcDovi7c1tfJvP58VzsiyL16bTaTo+Phbb
eK8aSJBmPv423RFKyWGnZOjNNRAujsfiafUnUkIi/Ku9XaTwfuXeKEWLWT1TX1BuAon7p6iY
LzII3dRn4IN0ciavHgo+Tv9KvYBwVS7O+mYCqy9+QVVTj+23rW68CySw/zU+yP93/euMGKCw
ukKZqZ+If8JW3LbQbSBc2ZSF8EE+59n+HSDNDh4f5DNFSqzRbRhS/D3+HvI5k5cc10BOXN9Q
NrXVVytSBgakWk6LfiQVWSCvx0wej6cvlwYN5D8O4DNqviRiNpvFdSk+28YHecAkEgnxszQu
vhzCP1PDB8EPPgg+CH7wQfBB8IMPgg+CH3wQ/OCD4IPgBx8EHwQ/+CD4IPjBB8EHwQ8+CH7w
QfBB8IMPgg+CH3wQfBD84IPgg+AHHwQ/+CD4IPjBB8EHwQ8+yIDmH9dg+7bM7y8iAAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTPieExample >> exampleLabelledChart [

	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection).
	b slice: #numberOfMethods.
	b normalizer distinctColor.	
	b labeled.
	^ b
]

{ #category : #icons }
RTPieExample >> exampleLabelledChartIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAFQklEQVR4XuXb608iVxgG8P1n
N/20SdNPzbZpsp/6pXZrbbbNdtMa0q712ijFS9yAFxhERlDkIqDAogsG8YYwXNR3ynvqkJV1
XRyOFXie5A0IJCbnl5lzzpxzHuk6fjopj/CbAB8EP/gg+CD4wQfBB8EPPgg+CH7wQfBB8IMP
gh98EHwQ/OCD4IPgBx8EHwQ/+CD4IPjBB8EPPgg+CH4wQGrv9qjkdunNpamrdHF6Svgg9xw6
P6eSx02FaRvln3+nf6oOX/5MJZeTyoF1wgeRmMtymUqKk/I/9bcEcVMdDf5G2ppK+CBtRvOu
MoJpiPcrMPInjSRCtK8VCR/ERArWSSkQV0V9AYX6Nt06V+T4gPBBWu0rLi/pZGRIJoY+5Zhp
YBj15l1CoGQyGUomk8Thv8/Ozhrv8UHqORn5SypGvv/7DzCM8ueztLa2JkD8fj+l02na2Nig
QCBAwWCQdnZ2yOFwUDgcpqmpKdrf36dIJCK+hwAp2KxyMeo1ujDzURBxpfi8xFdJLpej4+Nj
Ojg4EA3PGOX6gII/9/l8FIvFBEKpVKoP+M57H0RTvdIx1LHXt2Jw/RjyUPXiouUGZqSev2Xx
0Db/vE86yKC69EkQLkcmSfid+nsR8wzJGG8mh/VWMIzKlArU0yCaptFNl3fzCIZn4LIxci8G
rg1zWylLfKP3QDY3NwUCd4BWq1WMTrgT5I4yGo2K0QxXKpUSHSmPZLJzM/KvDtvEnTCMunzg
4e69gHBD8wjFYrFQKBSi3d1dymaztL29TXt7e2LIyFA8zOT3hel/pIJEfn9pCsMYBvcUyMXV
aKVarYrXSqVSn+ddiomW8ZnxG+PW9X8Pc28rfrQC3alX67cumRhByyvTGEZBg/D6hUyQgQ0F
H6RTQJyzk21j4INIBJGBgQ8iESRYn1wGlgN6u4UPIgkk6n2KD9L2bP6/FUEpIFuex3p45W/C
B2nnoWKlLBWEK+hymEYJuoIE/3CRd4fIBImsfGsaJJPI4IPI6kcMEHHrcg+bQikXy/gg1WSC
ZINseZ4xyF1RCH895Coy1tGvgzzWQ8qrO4FkU1l8kMZVsh2XDsK16ZxrCSXmi+GvGDbndHyE
2gP5jJpBwu5nLYEUDgv4IM05z+Xo6NdfTKPEvV/QTVfJ1up0A8U2arsGocwpeiqc+gCD13R4
p0mtVhPf8c6T5t/w2g7v4epZELF+Et0yDZLwPL0ZpF7c+GN/jInX2fFZ3W6169Zhqz40OESL
i4ti+w8vlvEeLKfTSSsrK6KheS3H6/WK3/DfS0tLYqGNP7PZbBSPx8nlclEikaD5+Xmxp6un
QER/8tbcGklq+ZuPgmx5+sk169KHLcO6alf19cV1feL1BE3bpkXj8v/lRuWrwmhYRVHE/itG
4OXoYrEoYHjP1sLCAnk8HuIVUrvdLlZIGVRV1d4D4dTS6TujvJ35+haQ+gxecTVuXbG1GFW0
Ssfu7+3Izdbn+TwdvhhoGSY99qV+G4jx8DEZSuLvfm8nRecyyQCJqZ+TVjzsijMiXXGCio+q
5Qd+oLuC7Kx/RYUjf1edouqaM4Z8VEHz+8TZwpPxUboJJOp9QtmEhQ72pvRSId6VZw3xT+Hi
g+AHHwQf5GHDjzt41o0P0iHhRxy8t5iPqfFmb55R44M85Gy//mCQd+Hzpm5+WOh2u/FBHjrG
Bm/e2H3f5wLxQfA7dfzgg+CD4AcfBD/4IPgg+MEHwQfBDz4IPgh+8EHwQfCDD4IffBB8EPzg
g+CD4AcfBB8EP/gg+CD4wQfBDz4IPgh+8EHwQfAjIf8CK2x8XCu31d4AAAAASUVORK5CYII='
]

{ #category : #sources }
RTPieExample >> exampleLabelledIf [
	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: RTShape withAllSubclasses.
	b slice: #numberOfMethods.
	b normalizer distinctColor.	
	b labeledIf: [ :c | c numberOfMethods > 18 ].
	^ b
]

{ #category : #icons }
RTPieExample >> exampleLabelledIfIcon [
	^ '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
l/8BzNJh52yayYQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTPieExample >> examplePieAndLegend [
	"
	RTPieExample new examplePieAndLegend
	"

	| b myClasses lb |
	myClasses := (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).

	b := RTPieBuilder new.
	b interaction popup.
	b objects: myClasses.
	b slice: #numberOfMethods.
	b normalizer distinctColor.	
	b labeled.
	b emphasize: Set by: 20.
	b emphasize: Dictionary by: 20.
	b build.
	
	"Legend"
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Distribution of number of Methods in some classes'.
	myClasses do: [ :aClass |
		| aColor |
		aColor := (b view elementFromModel: aClass) trachelShape color.
		lb addColor: aColor text: aClass name.
	].
	lb build.
	
	^ b view
]

{ #category : #icons }
RTPieExample >> examplePieAndLegendIcon [
	^ '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
rkJggg=='
]

{ #category : #sources }
RTPieExample >> exampleRefreshPie [

	| view fillView |
	"We create an empty view. The view will contain the button and the pie."
	view := RTView new.

	"fillView is block that: 
		(i) remove all the elements in the view (except the button); 
		(ii) create a new pie with totally random data
		(iii) force a screen refresh with #signalUpdate"
	fillView := 
	[
		| b |
		view clean.
		b := RTPieBuilder new.
		
		"The RTPieBuilder will create the pie in the view"
		b view: view.
		b interaction popup.
		b objects: ((1 to: 10 atRandom) collect: [ :i | 30 atRandom ]).
		b slice: [ :aNumber | aNumber ].
		b normalizer distinctColor.
		b labeled.
		b build.
		view signalUpdate
	].

	"Add a button menu to the view"
	view addMenu: 'Generate new data' callback: [ fillView value ].

	"We want some data when opening the view"
	fillView value.
	^ view

]

{ #category : #icons }
RTPieExample >> exampleRefreshPieIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAGPklEQVR4XuXdbUidZRwG8Gfq
bEGB9EUoYq31JQgKHLFRUysW6wU2wqAF+W3GIBpEFNbimFFfks2WgU6XW1PsNMSX5UpJj0dd
bjtOt7V5puj0zOMst+G7O7p5nZ77cR7Py+PzcszTcdclfxTPi8+5f9zPfZ/73Mcjeb38iaZI
/E3AD8IfLRCbzYba2lroXbG1tRVG7rCoqAhmb8MfPxDRaDU1Nairq0N7ezusVivKy8vR0tKC
4uJinDp1Sqnc3FxkZGSgtLRUuU5DQwMqKiqQl5eHbdu2Kd+zs7MhQPxvU19fz49iBmRqago5
OTno7u6G3W5HZ2cnenp6lMYVP4seNDAwgP379yuN63Q6fdc5cuSI0thjY2OYnJzE9PQ08vPz
A24j7pu/mfnHEH4Q/vCD8IPwhx+EH4Q//CD84QfhB+EPPwg/CH/4QfhB+MMPwg/CH34Q/vCD
8IPwhx+EH4Q//CD8ICub8fHxiOxS6e3tRX9/P5qbm8EPopGmpqaINZDYkya2LPGDqKSvr897
9epViEYS+7tW+u+JvyX2knV1dfGDRCoeD8A/hqxQcOMccOJl4LqxU9rgICDJjy4+HjhwYPXA
RD0IJt1AeRK8BfKhyoX6dw01rsUiPzjJv4DKyuiHiWoQnP/WBxFQBpKQMN9DgislJbpRohYE
1anqGKKXdJfqNqoaxkLFxgJud3TCRCUIKl9YEkMBEZdr5PBh9d4RXPJEC/wgehgnXtLEMHLa
Sk83BrJmDT+IZvIB2KpTDIHg4ncI53QVXMmbPZzPQwbleejc3BzkJ4CqDTAiY0j3DuiDnp91
UVD6hPr9jBjrHaJ2xlZD/IBDh0AH4pZHUfFdrB+pXb7VD0TU8zcv4O6hOO2xZO4u9Ke76mWT
UgN/oZGhoSHcdyBiSUQsj4gKjisIw1fy75s0TmFo+zKkoRITtXtIstSoegEsFmgs60C89Y9m
DHlvKZB7ta+zUBUFhx+CmfHjWFw6NK+gsr4mVoUjuQApRct5U6+2DDuAAikEBrdv+RrLalXv
Hetjr+GfmEToncdgt4N+ltWh0zuCT2F/VicHoODMZ75G3LMnFOT92EIYnXIhM5MfxGIUw6++
uZi7uLYleo3q6QqwS8kwMwfG2rX8IDvM9BC/enGoZRFlpAszM4u9I1VqMAVhdLZFAbIBbyAG
+2QUizcWX+Fx1GEdJg0hxcmYjip5wty0B1lZ8yAnpdfCx+AHEQeg/xUjkz2JzXgYHytwoh6F
FY/ArcAdPJeNtze2wSPFLw+DH8QYiN7XWzdfwZmjNmRIBd7lFj1IPOKxHIyv3XvhbXR42wos
3tnbd5H1zC/gB1lGtmN72CDVXd8rGKJK31xc2/oxvQH8IGFPey1hYdRfyPdhiCpICnwozj/c
plH2JhTzT3ub0Wy6h9g6AjE8dXYIkDF3b0CDTo968PnGMsMw5Z+e5gcxO7CfaT8agCFq4KdC
BUSMI2r5YcfvhlD6zg7zgCxsEVXbBJeGNEO95NrZ30IwRHVkfaiAlO18askGvVw7ALPjx8TE
BPyP/b4CcTgcyn+hU3s9xAmnJsiDc+vgaTmtiqHMsDJ3K2NI8DgS0sA3buOTx46pwlR94VBt
9CtXrig7HO8rEPGASkpKlFcLl9q6uQmbVFE2zqwHGh1LYgSDTAy5dBvv4OsnYWR2JY5ZbDkV
/1+SagwRccEVArJl4jlNiIVq+WgXFkCWGkeCc76634diy7vE9xKuoSkwLD6UlNEkQxiiKnYl
+UCsaU8bbtybfePIffVX/s3WWtmKrUgdMY4hqmjLAz4QvXEk2hOdG+Ucl0yB+GOImhweBD/I
f43S7kS4IEbHEX4Qsyjd/QgH5Pg7z/L3kBVDmZgCWi/ADMhqHkdW0Rt2RoCzf4XAzDWchhrI
1K2/wQ8SCRgR13Xgco+CM3zcGgJStTsFg202/h7CH34QfpBIZXR0VBkDIrWnlh9EJx7P/Ps2
2D6lJ2pBysrKlA+FEZ/8ww+yCrPwIpJ4L8fMzAz/E8P/O3fu3IEol8uF2dlZfhD+8IPwg/CH
H4QfhD/8IPzhB+EH4Q8/CD8If/hB+EH4ww/CD8IffhD+8IPwg/CHH4QfhD/8IPwg/OEH4Qfh
Dz8If/hB+EH4ww+y2vIvwbhd6S5RRvwAAAAASUVORK5CYII='
]

{ #category : #sources }
RTPieExample >> exampleRingChart [

	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b shape current
		innerRadius: 70;
		externalRadius: 100.
	b objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	b slice: #numberOfMethods.
	b normalizer distinctColor.	
	^ b
]

{ #category : #icons }
RTPieExample >> exampleRingChartIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEUUlEQVR4XuXca0/aUBgHcL/s
3u077Avo1HmZ6LLoEnUat2UzOl2yeEEBRadTQAjelclFpRRaWiwP4xgxKudU1EJL/v/keSv6
/DztOaentJRK+HFSWvBbgA+CH3wQfBD84IPgg+AHHwQfBD/4IPgg+MEHwQ8+CD4IfvBB8EHw
gw+CD4IffBB8EPzgg+AHHwQfBD/4IPggNsWQ0qT4vKR4l0sPS4tGCR+kAVFWfHQ54KLz9tZS
rZWbnyMjnSZ8EItChkHy9NSTEHh10d9H+tEh4YO8ZER4ll8McbeSvV00vLtNehkZH+Qpo6JQ
oMvBj5ZisBp2z1LbtrfEal925mXMcSBXibjlEKxCgwO3GJX6HdsnfBALMeSpyapZVm5xns57
3lX9nL7N5SoQVpNHEcIH4aSYz9eEIc9Mk5GVa2qi6l+h8442WpsY4WJUyp+MET7Ig1y43puC
SGOjRFdXz2oca7gZCKvTXIbwQW4i/5oxxcgHAy9uVragU1dw1QwGH+R6xS3LphiF42PLGkXl
9IfXhSizp7sEDyKNjQhBtF3rt0CKZRQ2GkQoBhUJFsTsRp75OlG3xvxTZCGI3VNhW0HYPpMI
pN75UZ7uilBgQUQYimep7v+lN5cuLshRViI4kKKu2zY6KhnfD3JRFs4O8UCuF228XdkProY1
Y/sywQXpCPjwQJQlNxeEbX80Mk67j7TYN90d5YJokTDhg9hxQ+dsALIqKgo+iB1JtbdyQajY
2IXZN/8at+BALvp6uCBGprFTzi33FrfgQNhKnAei/t3AB7FlllWeTdm1KKyEbTbig1TWIZsb
/IVh+WbfqN8heZLkgoR8IcLfOrk709K0hjRkZ3WHCxI/ioPuZXV1kOgxbb0/W1M14eVKz+uY
I0TxeoT7WfVej0Q3oiIQ3O13dlMVgaQ/DdatMVJKEo6OxHECF4RF/ik+JipPT1reHDWrCjHs
nF05BsRslFQOS1v1WXklb4qRiqXwn6lfNyoUMD8C9GX8xY2SL2VTjLA/jH/q5N51ffyz+UG5
zrekHx48uWlUNOg4MmeKwaqgF/BBqva3XL2Pnl686O0i9c/6o81T5T06iXRTeOVViVXQuy5E
yUpZx/TAUSBsp/e8u/NJ53vTo8OUW5ijnHuBYlEXRfyvbxHu1eobLgi7lDmpB447/c5u8umh
572KwIW4UyHf1D2UbDqLf/q95pvw5HeyGoQVgwh4AmTnarwpQVgKsVMSPVl8Lkj8YNnRr7U1
xUufWihIon2vWkHO9ofKF8Mi/juGVsbIZCi3tEhsClwLSCw6QFLK01SvSDf1FweQrpO+t0vq
mp+U1RWSkh7S1DNq5r8J/5sc8EHwgw+CD4IffBB8EPzgg+CD4AcfBB8EP/gg+MEHwQfBDz4I
Pgh+8EHwQfCDD4IPgh98EPzgg+CD4AcfBB8EP/gg+CD4wQfBB8EPPgh+8EHwQfCDD4IPgh98
EHwQ/DQo/wGK0Xg+nbEqTgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTPieExample >> exampleSimple [

	| b |
	b := RTPieBuilder new.
	b interaction popup.

	b objects: #(10 4 1 2 5).
	b slice: #yourself.
	b normalizer distinctColor.
	b labeled.
	^ b
]

{ #category : #icons }
RTPieExample >> exampleSimpleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEGUlEQVR4XuXba0/aYBiHcb+a
r/xYfgL3AjfnskO2bNnicSIdkCgqo7RQNpEKKjgBdSDgCfAwhnCztkYHyqGlSEv+V3LH1/Tn
Ux4eylCthp+ZGsK/BPgg+OGD4IPghw+CD4IfPgg+CH74IPgg+OGD4IcPgg+CHz4IPgh++CD4
IPjhg+CD4IcPgh8+CD4Ifvgg+CD44YOoKRKJkPzXYrEQPoiJKpfLlE6nCR/E4EqlEsnjdrvx
Vwh++CD4IPjhg+CDDELx4hlx2cOaNblDE1sBGtvka+MRP03thYnNHND6SZrk8EGesETxnD7t
isrFVzvjEYGEXIrwQXrYwUWe5AurBaLZBEwMMzAgs/Et3RD1I9/ezkrXhA+isaubMlnC/p5i
1E9SWnX4ICqT/4OfCqJ+ovkTwgfp0E21SmMi1xcQefZNslJMC/Imut43jLuRb4/4IE1yHyX7
jiHPu2gQH+Rh5WrFEIy7iZzlCB+kLuYgZiiINPgg9RmMocz2+THhg0jJn6DNAPJROpbBB5EK
r27Q3BpHb4OC4TD4IFLCV2/DrLj8NMP7DcE5/WPMsYqpQeonwPhoxs3VXoj9AfJKR/fQIFeF
K2oH8nAca376Eni6W5v8HQs0yOnhsSaQ+uEcPpr18PRM5HsG5ErFsVfI8X62a5D6+eFg6bvF
U9M70eUYNkghd64bhHW6KL7J9AQkwSexQaqVqi4QdsFFPnaBEmGm1guQpG8ff9vb9XuIdZUW
Fz/XEhF7z0CyO1n8bW/AymlfJTavguFemVMw5PG/53XftvA/GEodhpOaQRhmSgHZ23Tcg2ws
unSBeJ6zWEcnw8PDTV/w3+uSJhAnM69guJb+rw4FxLak8/0jiQMiiiKNjIy0fMFBh6AKxWmd
UzDkify0NYDE+FVdK8TIB+tMd/yez5x1BFlzOO4x7PbpBoy76RZj27mD/31Is1PfVhhexnWP
IY8YsPUUxOjHTk0JUrmpNAVhvzZiKFvdJhjdguRiOfzv1FveurKNn9z9jOcRhsDOUysQ4YO2
ra84L+I/BtSpdOz3LcqC8llD9eq43fouqwYJTm/gPyintsxemhz22UcYd8ckLUFUbn03ZkL4
j5JqPgk+zjRZHd/aguz6Om99Y64Y/sPWXR8+VqvEcbdv6p7VubYYnd7YuVc8FY4KbTEmJibw
z7LUVCzmKRX3dQXifclRZiuj6kLn83m6vLwkfBAtO7HcL0rtsdQOhH/tI/kopHRRGoifteH/
6BMfRH2hUIjwQUyUIAj4IGZqdHQU/5aFHz6Izm1wkSYnJwkfxCR5PB6SUfBB8MMHwQfBDx8E
HwQ/fBD88EHwQfDDB8EHwQ8fBB8EP3wQfBD88EHwwwfBB8EPHwQfBD98EHwQ/PBB8EHwwwfB
Dx9kAPoHXr9gU/fk5PYAAAAASUVORK5CYII='
]

{ #category : #accessing }
RTPieExample >> label [
	^ 'Pie chart'
]
