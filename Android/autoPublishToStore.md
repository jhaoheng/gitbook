<http://www.slideshare.net/plateaukao/play-publisherplugin-danielkao20160420>

## Gradle Play Publisher Plugin

1. Gradle Play Publisher Plugin Daniel Kao <daniel.kao@gmail.com>
2.  Android developer (but writing server codes now…  Self developed apps  AutoScreenOnOff  書法加 Who am I
3.  Why  What is it  How  Demo time (if there’s still time…  Reference Agenda
4.  Manually uploading apk and updating store listing is  Tedious  Error-prone  Difficult to control versions of store listing data  With the plugin, you can  Do it with one command  Use any VCS to keep track of your data  Integrate it into your deploy server Why
5.  A Gradle plugin to upload your APK and app details to the Google Play Store. What is it?
6.  URL: https://developers.google.com/android- publisher/#publishing  Features  Upload new versions of an app  Release apps to (alpha, beta, staged rollout, production)  Create/modify Store listings  Available languages  Java, Python, REST APIs Google Publishing API
7.  Create Google Service Account  Setup plugin in build.gradle How
8.  Go to the API Access page on the Google Play Developer Console. Create Google Service Account
9.  API Manager New Credentials
10.  Create service account key
11.  Create new service or use a new one  Choose either key type  Save the downloaded file for later use
12.  Grant Access Create Google Service Account
13.  Accept it New Credentials (cont’d)
14.  Check necessary permissions Grant Permissions
15.  Add dependency  Apply the plugin Setup build.gradle
16.  Configure play section Setup build.gradle (cont’d)
17.  Extra settings Setup build.gradle (cont’d) Setting Description errorOnSizeLimit = false Do not check text length limit track = 'production' Or ‘beta, ‘alpha’, ‘rollout’ userFraction = 0.2 Only works for ‘rollout’ track. It means the portion of users who should get the staged rollout version of the APK. uploadImages = true Default is false
18. Task Name Description bootstrapReleasePlayResources Fetches all existing data from the Play Store to bootstrap the required files and folders. publishApkRelease Uploads the APK and the summary of recent changes. publishListingRelease Uploads the descriptions and images for the Play Store listing. publishRelease Uploads everything. What’s been offered.
19. Directory Tree
20. Directory Tree II
21.  Need to upload first release through web so that it knows the package id Tips
22. Demo
23.  Publishing API https://developers.google.com/android-publisher/#publishing  Client library samples from Google https://developers.google.com/android-publisher/libraries  Gradle Play Publisher Plugin Github https://github.com/Triple-T/gradle-play-publisher Reference