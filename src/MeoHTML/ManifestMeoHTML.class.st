"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMeoHTML,
	#superclass : #PackageManifest,
	#category : #'MeoHTML-Manifest'
}

{ #category : #'code-critics' }
ManifestMeoHTML class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#MeoAppRootComponent)) #'2020-08-16T11:23:11.880186+02:00') )
]

{ #category : #'code-critics' }
ManifestMeoHTML class >> ruleRBUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#MeoHTML)) #'2020-08-14T01:24:27.320468+02:00') )
]

{ #category : #'code-critics' }
ManifestMeoHTML class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#MeoHTML)) #'2020-08-16T12:38:46.905936+02:00') )
]

{ #category : #'code-critics' }
ManifestMeoHTML class >> ruleReTestClassNotInPackageWithTestEndingNameV1FalsePositive [
	^ #(#(#(#RGPackage #(#MeoHTML)) #'2020-08-14T01:21:17.5736+02:00') )
]

{ #category : #'code-critics' }
ManifestMeoHTML class >> ruleWAUnnecessaryBlockPassedToBrushRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MeoPostsListComponent #renderContentOn: #false)) #'2020-08-17T02:26:32.437707+02:00') )
]
