package guide.flutter.com.flutterwidgetguide

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

//Class added to support background operations for FCM notifications
//Added this to android:name property of the <application/> tag in
//manifest
class Application : FlutterApplication(), PluginRegistrantCallback {
	override fun onCreate() {
		super.onCreate()
		FlutterFirebaseMessagingService.setPluginRegistrant(this)
	}

	override fun registerWith(registry: PluginRegistry?) {
		GeneratedPluginRegistrant.registerWith(registry)
	}
}