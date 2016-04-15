# DaggerTemplate
Template for Android Studio wizard for projects using Dagger
Create new folder in %Android Studio install directory%\plugins\android\lib\templates\activities\ and name as you wish
Copy everything from repo to fresh created directory and if you have Android Studio opened close it and run again. Then when you will be creating new project for Android you should see along with
Basic Activity or Empty Activity the template named Dagger App.

Poorly, I didn't manage to write template for some sections for project, so you have to configure them for yourself as described below and in file which you will see after project has been created.

You can configure project with wizard to use common libraries:
1. Retrofit 2b4
2. OkHttp 3
3. GsonConverterFactory
4. EventBus 3
5. RxJava and RxJavaCallAdapterFactory

While using this template for Dagger type project remember to:
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

#LICENSE

Copyright 2016 Michał Markiewicz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
