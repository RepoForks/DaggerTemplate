While using dagger remember to:
1. In Project: build.gradle:
	Add APT plugin:
	classpath 'com.neenbedankt.gradle.plugins:android-apt:1.8'
2. In your module's build.gradle:
	2.1 Apply APT plugin:
		apply plugin: 'com.neenbedankt.android-apt'
	2.2 change
		compile 'com.google.dagger:dagger-compiler:2.0.2' to apt 'com.google.dagger:dagger-compiler:2.0.2'
	2.3 change
		compile 'org.glassfish:javax.annotation:10.0-b28' to provided 'org.glassfish:javax.annotation:10.0-b28'
3. In your AndroidManifest:
	add:
	<application
        android:name=".${applicationClass}"
		....